class AddResponseCols < ActiveRecord::Migration[4.2]
  def change
      add_column :responses, :response_set_id, :integer

  end
end
