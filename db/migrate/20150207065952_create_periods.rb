class CreatePeriods < ActiveRecord::Migration[4.2]
  def change
    create_table :periods do |t|
      t.string :shortcode
      t.integer :teacher_id
      t.string :title

      t.timestamps null: false
    end
  end
end
