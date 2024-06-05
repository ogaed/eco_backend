# class Api::V1::ProfilesController < ApplicationController
#   before_action :authenticate_user!, except: [:index]

#   def index
#     @users = User.all
#     render json: { data: UserSerializer.new(@users).serializable_hash[:data].map { |user| user[:attributes] } }
#     # @user = current_user
#     # render json: {
#     #          status: {
#     #            code: 200, message: "Signed up successfully",
#     #            # data: resource,
#     #            data: UserSerializer.new(@user).serializable_hash[:data][:attributes],
#     #          },
#     #        }, status: :ok
#   end
# end
class Api::V1::ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 100

    @users = User.paginate(page: page, per_page: per_page)
    render json: { data: UserSerializer.new(@users).serializable_hash[:data].map { |user| user[:attributes] } }
  end
end
