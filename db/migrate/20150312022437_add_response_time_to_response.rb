class AddResponseTimeToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :response_time, :datetime
  end
end
