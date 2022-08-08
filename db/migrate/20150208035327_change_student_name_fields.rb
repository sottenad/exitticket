class ChangeStudentNameFields < ActiveRecord::Migration[4.2]
  def change    
      rename_column :students, :first_name, :name
      remove_column :students, :last_name
  end
end
