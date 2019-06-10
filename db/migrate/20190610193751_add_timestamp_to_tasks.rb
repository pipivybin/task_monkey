class AddTimestampToTasks < ActiveRecord::Migration
  def change
    add_timestamps(:tasks)
  end

  def down
    remove_column :tasks, :create_date
  end
end
