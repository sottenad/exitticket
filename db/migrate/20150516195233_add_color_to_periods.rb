class AddColorToPeriods < ActiveRecord::Migration[4.2]
  def change
    add_column :periods, :color_id, :int
  end
end
