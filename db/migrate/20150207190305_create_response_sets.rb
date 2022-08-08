class CreateResponseSets < ActiveRecord::Migration[4.2]
  def change
    create_table :response_sets do |t|

      t.timestamps null: false
    end
  end
end
