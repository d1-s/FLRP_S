class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.date :visit,              null: false
      t.string :restaurant,       null: false
      t.integer :category_id,     null: false
      t.integer :compartment_id,  null: false
      t.integer :reserved_id,     null: false
      t.time :open,               null: false
      t.time :close,              null: false
      t.integer :prefecture_id,   null: false
      t.string :city,             null: false
      t.string :address,          null: false
      t.string :buiding
      t.integer :budget_id,       null: false
      t.text :introduction
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
