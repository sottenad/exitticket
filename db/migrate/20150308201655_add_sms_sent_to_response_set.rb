class AddSmsSentToResponseSet < ActiveRecord::Migration
  def change
    add_column :response_sets, :sms_sent, :boolean
  end
end
