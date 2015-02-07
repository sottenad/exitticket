class ChangeUserPhoneNumberToText < ActiveRecord::Migration
  def change
      change_column :students, :phone_number, :text
  end
end
