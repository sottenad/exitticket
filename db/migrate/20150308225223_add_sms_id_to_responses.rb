class AddSmsIdToResponses < ActiveRecord::Migration[4.2]
  def change
    add_column :responses, :sms_id, :string
  end
end
