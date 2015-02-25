class AddResponseCols < ActiveRecord::Migration
  def change
      add_column :responses, :response_set_id, :integer

  end
end
