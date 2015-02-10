require 'twilio-ruby' 
module TwilioUtils
     
    def self.included(base)
        base.extend(ClassMethods)
    end
    
    module ClassMethods
        def send_sms(recipent, message)
            twilio_sid = ENV["TWILIO_ACCOUNT_SID"]
            twilio_token = ENV["TWILIO_AUTH_TOKEN"]
            twilio_phone_number = ENV["TWILIO_PHONE_NUMBER"]

            @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
            #@twilio_client.account.sms.messages.create(
            #  :from => twilio_phone_number,
            #  :to => recipent,
            #  :body => message
            #)
            return true
        end 
    end
end