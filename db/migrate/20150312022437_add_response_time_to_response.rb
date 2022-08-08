class AddResponseTimeToResponse < ActiveRecord::Migration[4.2]
  def change
    add_column :responses, :response_time, :datetime
  end
end
