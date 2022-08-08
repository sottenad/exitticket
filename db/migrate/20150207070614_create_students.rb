class CreateStudents < ActiveRecord::Migration[4.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.integer :period_id

      t.timestamps null: false
    end
  end
end
