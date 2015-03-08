module SmsUtils
    
    require 'nexmo'
    
    def self.included(base)
        base.extend(ClassMethods)
    end
    
    module ClassMethods
        def send_sms(recipient_num, message)

            nexmo = Nexmo::Client.new(key: ENV['NEXMO_API_KEY'], secret: ENV['NEXMO_API_SECRET'])
            if(nexmo.send_message(from: 12097299390, to: '12537979309', text: 'testing from module'))
                return true 
            else
                return false
            end

        end 
    end
end