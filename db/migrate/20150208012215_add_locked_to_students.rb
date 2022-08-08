class AddLockedToStudents < ActiveRecord::Migration[4.2]
  def change
    add_column :students, :locked, :boolean
  end
end
