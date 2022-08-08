class AddFirstNameAndLastNameAndAvatarUrlToTeachers < ActiveRecord::Migration[4.2]
  def change
    add_column :teachers, :first_name, :string
    add_column :teachers, :last_name, :string
    add_column :teachers, :avatar_url, :string
  end
end
