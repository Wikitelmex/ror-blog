class RemoveFieldsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :updated, :string
    remove_column :users, :created, :string
  end
end
