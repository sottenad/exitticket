class AddNumberToPeriod < ActiveRecord::Migration
  def change
    add_column :periods, :number, :integer
  end
end
