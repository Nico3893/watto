class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :details
      t.integer :price
      t.string :photo
      t.references :user, foreign_key: true
      t.string :category
      t.string :location

      t.timestamps
    end
  end
end
