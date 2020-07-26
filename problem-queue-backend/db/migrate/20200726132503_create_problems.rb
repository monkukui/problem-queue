class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.string :memo, null: false
      t.integer :priority, null: false
      t.string :problem_str
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :problems, [ :user_id, :memo ], unique: true
  end
end
