class RemoveAvatarUrlFromTeachers < ActiveRecord::Migration[4.2]
  def change
    remove_column :teachers, :avatar_url, :string
  end
end
