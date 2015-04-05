class AddTimeZoneToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :time_zone, :string
  end
end
