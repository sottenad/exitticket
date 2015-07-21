class AddColorToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :color_id, :int
  end
end
