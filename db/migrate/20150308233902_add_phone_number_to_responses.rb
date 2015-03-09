class AddPhoneNumberToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :phone_number, :bigint
  end
end
