class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :prompt
      t.integer :rating_total
      t.integer :rating_count
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
