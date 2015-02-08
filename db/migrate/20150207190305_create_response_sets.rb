class CreateResponseSets < ActiveRecord::Migration
  def change
    create_table :response_sets do |t|

      t.timestamps null: false
    end
  end
end
