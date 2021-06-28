class AddCreatedByIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :created_by_id, :integer
  end
end
