class ChangePhoneNumberInStudents < ActiveRecord::Migration
  def change
      change_column :students, :phone_number, 'bigint USING CAST(phone_number as bigint)'
  end
end
