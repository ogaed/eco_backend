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

  enum role: [:government, :environmental_ngo, :bisiness, :admin]

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 20 }
  # validates :location, presence: true
  validates :national_id, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
 


  # Callbacks
  before_validation :set_default_role, on: :create
  after_create :set_user_avatar


  # Methods
  def avatar_url
    Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
  end
  


  private

  def set_default_role
    self.role ||= "government"
  end

  def set_user_avatar
    avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default_avatar.jpeg")), filename: "default_avatar.jpeg", content_type: "image/jpeg")
  end

  
end