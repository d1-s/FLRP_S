class AddPrivateToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :private, :integer, null: false
  end
end
