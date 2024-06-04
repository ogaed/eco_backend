module Api
    class SearchAndMatchController < ApplicationController
    #   before_action :authenticate_user!
  
      def search_and_match
        @tourist = User.find(params[:id])
        if @tourist.tourist?
          Rails.logger.info "Tourist found: #{@tourist.inspect}"
          preferences = @tourist.preferences
          Rails.logger.info "Preferences: #{preferences}"
          @experts = User.where(role: :tourist_attraction).where("preferences ILIKE ?", "%#{preferences}%")
          Rails.logger.info "Experts found: #{@experts.inspect}"
          render json: { matches: @experts }
        else
          render json: { error: "User is not a tourist" }, status: :forbidden
        end
      end
    end
  end
  