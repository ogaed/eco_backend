module Api
    class CommunicationsController < ApplicationController
    #   before_action :authenticate_user!
  
      def create
        @communication = Communication.new(communication_params)
        @communication.sender_id = current_user.id
  
        if @communication.save
          render json: { status: 'success', message: 'Message sent successfully', data: @communication }, status: :created
        else
          render json: { status: 'error', message: 'Failed to send message', errors: @communication.errors }, status: :unprocessable_entity
        end
      end
  
      def index
        @communications = Communication.where('sender_id = ? OR receiver_id = ?', current_user.id, current_user.id)
        render json: { status: 'success', data: @communications }
      end
  
      private
  
      def communication_params
        params.require(:communication).permit(:receiver_id, :message)
      end
    end
  end
  