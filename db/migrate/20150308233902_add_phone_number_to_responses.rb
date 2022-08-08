class AddPhoneNumberToResponses < ActiveRecord::Migration[4.2]
  def change
    add_column :responses, :phone_number, :bigint
  end
end
