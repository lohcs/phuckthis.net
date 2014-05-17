class AddMonthToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :month, :integer
  end
end
