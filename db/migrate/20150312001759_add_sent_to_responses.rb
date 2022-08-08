class AddSentToResponses < ActiveRecord::Migration[4.2]
  def change
    add_column :responses, :sent, :boolean
  end
end
