class ChangeDescriptionColumnInProjects < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :body, :description
  end
end
