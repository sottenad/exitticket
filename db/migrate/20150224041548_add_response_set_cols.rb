class AddResponseSetCols < ActiveRecord::Migration
  def change
      add_column :response_sets, :question_id, :integer
      add_column :response_sets, :send_time, :datetime
      add_column :response_sets, :period_id, :integer
  end
end
