class ChangeStudentNameFields < ActiveRecord::Migration
  def change    
      rename_column :students, :first_name, :name
      remove_column :students, :last_name
  end
end
