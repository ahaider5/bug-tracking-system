class CreateProjectDevs < ActiveRecord::Migration[6.1]
  def change
    create_table :project_devs do |t|
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
  end
end
