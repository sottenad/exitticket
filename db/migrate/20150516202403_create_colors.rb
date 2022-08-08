class CreateColors < ActiveRecord::Migration[4.2]
  def change
    create_table :colors do |t|
      t.string :hex
      t.string :name
    end
  end
end
