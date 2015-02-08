class AddLockedToStudents < ActiveRecord::Migration
  def change
    add_column :students, :locked, :boolean
  end
end
