class AddTeacherIdToStudent < ActiveRecord::Migration[4.2]
  def change
    add_column :students, :teacher_id, :integer
  end
end
