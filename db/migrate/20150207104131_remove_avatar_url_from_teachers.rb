class RemoveAvatarUrlFromTeachers < ActiveRecord::Migration
  def change
    remove_column :teachers, :avatar_url, :string
  end
end
