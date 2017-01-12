class AddAnsweredToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :answered, :boolean, default: false
  end
end
