class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :details
      t.integer :price
      t.string :category
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
