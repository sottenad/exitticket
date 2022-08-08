class ChangePhoneNumberColumnOnStudents < ActiveRecord::Migration[4.2]
  def change
      change_column :students, :phone_number, :string
  end
end
