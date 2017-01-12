class Updatecolumn < ActiveRecord::Migration
  def change
    change_column :stats, :option_a, :boolean, :default => false
    change_column :stats, :option_b, :boolean, :default => false
    change_column :stats, :option_c, :boolean, :default => false
    change_column :stats, :option_d, :boolean, :default => false
  end
end
