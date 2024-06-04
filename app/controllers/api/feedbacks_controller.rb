module Api
    class FeedbacksController < ApplicationController
      before_action :authenticate_user!
  
      def create
        @feedback = current_user.given_feedbacks.new(feedback_params)
        if @feedback.save
          @feedback.expert.update_rating(@feedback.rating)
          render json: { status: 'success', message: 'Feedback submitted successfully', data: @feedback }, status: :created
        else
          render json: { status: 'error', message: 'Failed to submit feedback', errors: @feedback.errors }, status: :unprocessable_entity
        end
      end
  
      def index
        @feedbacks = Feedback.where(expert_id: params[:expert_id])
        render json: { status: 'success', data: @feedbacks }
      end
  
      private
  
      def feedback_params
        params.require(:feedback).permit(:expert_id, :rating, :comments)
      end
    end
  end
  