class RemoveCreatedateFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :create_date
  end
end
