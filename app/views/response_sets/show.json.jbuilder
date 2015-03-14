json.(@response_set, :id, :send_time, :sms_sent)
json.complete @valid_responses do |response|
    json.(response, :id, :response_text, :rating, :phone_number, :response_time)
    json.student response.student, :id, :name, :email
end
json.incomplete @invalid_responses do |response|
    json.student response.student, :id, :name
end

