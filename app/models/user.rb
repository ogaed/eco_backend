class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end

  # Associations
   has_one_attached :avatar, dependent: :destroy
  # has_many :crops
  # has_many :products
  # has_many :cart_items
  # has_many :issues
  # has_many :issues, foreign_key: 'farm_specialist_id', dependent: :destroy

  enum role: [:tourist, :tourist_attraction, :admin]

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :location, presence: true
  validates :national_id, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
 


  # Callbacks
  before_validation :set_default_role, on: :create
  after_create :set_user_avatar

  has_many :matches_as_tourist, class_name: 'Match', foreign_key: 'tourist_id', dependent: :destroy
  has_many :matches_as_tourist_attraction, class_name: 'Match', foreign_key: 'local_tourist_attraction_id', dependent: :destroy

  has_many :sent_communications, class_name: 'Communication', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_communications, class_name: 'Communication', foreign_key: 'receiver_id', dependent: :destroy

  has_many :received_feedbacks, class_name: 'Feedback', foreign_key: 'tourist_attraction_id', dependent: :destroy
  has_many :given_feedbacks, class_name: 'Feedback', foreign_key: 'user_id', dependent: :destroy




  # Methods
  def avatar_url
    Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
  end
  def search_experts
    User.where(role: :tourist_attraction).where('expertise LIKE ?', "%#{self.preferences}%")
  end

  def find_and_match_experts
    experts = self.search_experts
    experts.each do |expert|
      Match.find_or_create_by(tourist: self, local_tourist_attraction: expert)
    end
  end

  def update_rating(new_rating)
    total_rating = self.average_rating * self.number_of_ratings
    self.number_of_ratings += 1
    self.average_rating = (total_rating + new_rating) / self.number_of_ratings
    save
  end

  def recalculate_rating
    total_rating = received_feedbacks.sum(:rating)
    self.number_of_ratings = received_feedbacks.count
    self.average_rating = number_of_ratings > 0 ? (total_rating / number_of_ratings.to_f) : 0.0
    save
  end

  private

  def set_default_role
    self.role ||= "tourist"
  end

  def set_user_avatar
    avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default_avatar.jpeg")), filename: "default_avatar.jpeg", content_type: "image/jpeg")
  end

  
end
