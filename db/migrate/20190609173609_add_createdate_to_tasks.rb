class AddCreatedateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :create_date, :timestamps
  end
end
