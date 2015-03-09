require 'modules/sms_utils'

namespace :sms do
    include SmsUtils
    desc "Rake task to check for exit slips to be sent"
    task :check => :environment do
        puts Time.now.to_s
        #puts Teacher.first.display_name
        response_sets = ResponseSet.where("sms_sent=? AND send_time<?", false, Time.now )
        response_sets.each do |r|
            SmsUtils.send_response_set(r)
        end
    end
end