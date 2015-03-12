module SmsUtils
    
    require 'nexmo'
    
    def self.included(base)
        base.extend(ClassMethods)
    end
    
    module ClassMethods
        def send_sms(recipient_num, message)
            nexmo = Nexmo::Client.new(key: ENV['NEXMO_API_KEY'], secret: ENV['NEXMO_API_SECRET'])
            if(nexmo.send_message(from: ENV['NEXMO_NUMBER'], to: '12537979309', text: 'testing from module'))
                return true 
            else
                return false
            end
        end 
        
    end
    
    def send_response_set(response_set)
        respsetid = response_set.id
        questionprompt = response_set.question.prompt
        period = response_set.period
        nexmo = Nexmo::Client.new(key: ENV['NEXMO_API_KEY'], secret: ENV['NEXMO_API_SECRET'])
        if period.students.count > 0
            period.students.each do |n|
                phonenum = n.phone_number.to_s
                sms = nexmo.send_message(from: ENV['NEXMO_NUMBER'].to_i, to: phonenum, text: questionprompt)
                if sms
                    resp = Response.new
                    resp.response_set_id = respsetid
                    resp.student_id = n.id
                    resp.rating = 0
                    resp.sms_id = sms
                    resp.phone_number = phonenum
                    resp.sent = true
                    resp.save
                end
                sleep(0.3)
            end
            response_set.sms_sent = true
            response_set.save
        end
    end
    
end