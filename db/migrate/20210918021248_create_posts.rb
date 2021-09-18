class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.date :visit,         null: false
      t.string :restaurant,  null: false
      t.integer :category,   null: false
      t.time :open,          null: false
      t.time :close,         null: false
      t.string :address,     null: false
      t.integer :budget,     null: false
      t.text :introduction
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
