class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.text :question
      t.string :option_a
      t.string :option_b
      t.string :option_c
      t.string :option_d
      t.integer :option_a_count
      t.integer :option_b_count
      t.integer :option_c_count
      t.integer :option_d_count
      t.integer :user_id

      t.timestamps
    end
    add_index :surveys, :user_id
    add_index :surveys, [:id, :user_id]
  end
end
