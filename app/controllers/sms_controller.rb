
require 'yaml'
require 'json'

require 'AfricasTalking'

class SmsController < ApplicationController
  def send_sms
    username = "culture"
    apikey = "bfba4e7a4d5d4ec5fe689813712b29dc6fbf4392e90f5c02361137ce0bea66b7"

    africas_talking_client = AfricasTalking::Initialize.new(username, apikey)
    sms = africas_talking_client.sms

    message = "Thank you for using Nairobi city county tourism and culture system. Welcome agaibn"

    options = {
      "to" => params[:to],
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
