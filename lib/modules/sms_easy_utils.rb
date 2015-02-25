module SmsEasyUtils
     
    def self.included(base)
        base.extend(ClassMethods)
    end
    
    module ClassMethods
        def send_sms(recipient, message)

            easy = SMSEasy::Client.new
            easy.deliver(recipient.to_s, "verizon", message)

            return true
        end 
    end
end