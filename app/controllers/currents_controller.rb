class CurrentsController < ApplicationController
  # before_action :authenticate_user!
  # def index
  #   @user = current_user
  #   render json: { data: @user }
  # end
  # def show
  #   @user = User.find(params[:id])
  #   render json: { status: 'success', data: @user }
  # end

  # def index
  #   @experts = User.where(role: :tourist_attraction).order(average_rating: :desc)
  #   render json: { status: 'success', data: @experts }
  # end
  def index
    @users = User.all
    render json: { status: 'success', data: @users }
  end

  # def show
  #   @user = User.find(params[:id])
  #   render json: { status: 'success', data: @user }
  # end
end
