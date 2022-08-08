class AddMessageIdToResponseSet < ActiveRecord::Migration[4.2]
  def change
    add_column :response_sets, :message_id, :string
  end
end
