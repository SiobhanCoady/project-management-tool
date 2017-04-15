class AddBodyDoneAndProjectColumnsToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :body, :text
    add_column :tasks, :done, :boolean, default: false
    add_reference :tasks, :project, foreign_key: true
  end
end
