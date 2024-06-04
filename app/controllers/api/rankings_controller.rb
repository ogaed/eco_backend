module Api
    class RankingsController < ApplicationController
      def index
        @experts = User.where(role: :tourist_attraction).order(average_rating: :desc).limit(10)
        render json: { status: 'success', data: @experts }
      end
    end
  end
  