class CreateResponses < ActiveRecord::Migration[4.2]
  def change
    create_table :responses do |t|
      t.text :response_text
      t.integer :rating
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
