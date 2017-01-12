class ChangeColumnDefaultToSurveys < ActiveRecord::Migration
  def change
    change_column_default :surveys, :option_a_count, 0
    change_column_default :surveys, :option_b_count, 0
    change_column_default :surveys, :option_c_count, 0
    change_column_default :surveys, :option_d_count, 0
  end
end
