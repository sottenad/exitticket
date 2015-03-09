class AddSmsIdToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :sms_id, :string
  end
end
