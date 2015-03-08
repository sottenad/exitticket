class AddPeriodIdToResponseSet < ActiveRecord::Migration
  def change
    add_column :response_sets, :period_id, :integer
  end
end
