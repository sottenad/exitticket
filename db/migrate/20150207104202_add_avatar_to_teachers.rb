class AddAvatarToTeachers < ActiveRecord::Migration[4.2]
  def change
    add_column :teachers, :avatar, :string
  end
end
