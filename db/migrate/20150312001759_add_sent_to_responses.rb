class AddSentToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :sent, :boolean
  end
end
