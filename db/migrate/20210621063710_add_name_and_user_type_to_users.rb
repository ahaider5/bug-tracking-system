class AddNameAndUserTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :user_type, :integer
  end
end
