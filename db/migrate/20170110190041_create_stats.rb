class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :survey_id
      t.integer :user_id
      t.boolean :option_a
      t.boolean :option_b
      t.boolean :option_c
      t.boolean :option_d
      t.boolean :answered, default: false

      t.timestamps
    end
    add_index :stats, :user_id
    add_index :stats, :survey_id
    add_index :stats, [:user_id, :survey_id], unique: true
  end
end
