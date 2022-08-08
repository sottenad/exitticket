class AddSmsSentToResponseSet < ActiveRecord::Migration[4.2]
  def change
    add_column :response_sets, :sms_sent, :boolean
  end
end
