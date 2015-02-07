class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :shortcode
      t.integer :teacher_id
      t.string :title

      t.timestamps null: false
    end
  end
end
