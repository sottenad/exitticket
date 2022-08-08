class AddTimeZoneToTeachers < ActiveRecord::Migration[4.2]
  def change
    add_column :teachers, :time_zone, :string
  end
end
