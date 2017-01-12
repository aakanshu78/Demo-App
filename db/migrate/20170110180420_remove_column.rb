class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :surveys, :answered
  end
end
