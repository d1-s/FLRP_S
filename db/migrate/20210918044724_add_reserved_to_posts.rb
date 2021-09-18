class AddReservedToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :reserved, :integer, null: false
  end
end
