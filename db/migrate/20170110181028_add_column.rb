class AddColumn < ActiveRecord::Migration
  def change
    add_column :surveys, :answer_count, :integer, default: 0
  end
end
