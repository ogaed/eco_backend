class CurrentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    render json: { data: @user }
  end
end