
 class SmsController < ApplicationController
  before_action :authenticate_user!


  # def send
  #   # Set your app credentials
  #   username = "Opondo"
  #   apikey = "7287e8096c064d15988f445dc29c1e1731529b293efaff82cb4e094f63d508ca"

  #   AT = AfricasTalking::Initialize.new(username, apikey)
  #   sms = AT.sms
  #   message = "Thank you for using Africas Talking your items will be ready in 1 hour"

  #   options = {
  #     "to" => to,
  #     "message" => message
  #   }

  #   begin
  #     reports = sms.send(options)gem 'sinatra'
  #     # gem 'africastalking'

  #     reports.each do |report|
  #       puts report.to_yaml
  #     end

  #     render json: { success: true, message: 'SMS sent successfully' }
  #   rescue AfricasTalking::AfricasTalkingException => ex
  #     render json: { success: false, message: "Failed to send SMS. Error: #{ex.message}" }
  #   end
  # end
end
