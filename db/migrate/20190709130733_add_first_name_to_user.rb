class AddFirstNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :species, :string
    add_column :users, :homeworld, :string

  end
end
