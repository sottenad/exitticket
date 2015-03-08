class AddMessageIdToResponseSet < ActiveRecord::Migration
  def change
    add_column :response_sets, :message_id, :string
  end
end
