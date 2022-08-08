class ChangePhoneNumberInStudents < ActiveRecord::Migration[4.2]
  def change
      change_column :students, :phone_number, 'bigint USING CAST(phone_number as bigint)'
  end
end
