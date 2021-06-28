class CreateBugs < ActiveRecord::Migration[6.1]
  def change
    create_table :bugs do |t|
      t.integer :project_id
      t.string :title
      t.text :description, null: true
      t.datetime :deadline
      t.text :screenshot, null: true
      t.integer :bug_type
      t.integer :feature_status, null: true
      t.integer :bug_status, null: true
      t.integer :created_by_id, null: true
      t.integer :solved_by_id, null: true
      # t.timestamps
      t.column :created_at, :datetime
      t.column :updated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
