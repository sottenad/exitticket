class AddNumberToPeriod < ActiveRecord::Migration[4.2]
  def change
    add_column :periods, :number, :integer
  end
end
