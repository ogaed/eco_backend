require 'AfricasTalking'

class SmsController < ApplicationController
  # before_action :authenticate_user!

  def send_sms
    # Set your app credentials
    username = "culture"
    apikey = "bfba4e7a4d5d4ec5fe689813712b29dc6fbf4392e90f5c02361137ce0bea66b7"

    # Create an instance of AfricasTalking::Initialize
    africas_talking_client = AfricasTalking::Initialize.new(username, apikey)

    # Get the SMS service
    sms = africas_talking_client.sms

    message = "Thank you for using Africas Talking. Your items will be ready in 1 hour"

    options = {
      "to" => to,
      "message" => message
    }

    begin
      reports = sms.send(options)

      reports.each do |report|
        puts report.to_yaml
      end

      render json: { success: true, message: 'SMS sent successfully' }
    rescue AfricasTalking::AfricasTalkingException => ex
      render json: { success: false, message: "Failed to send SMS. Error: #{ex.message}" }
    end
  end
end
