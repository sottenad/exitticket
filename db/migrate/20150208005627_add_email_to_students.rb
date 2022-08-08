class AddEmailToStudents < ActiveRecord::Migration[4.2]
  def change
    add_column :students, :email, :string
  end
end
