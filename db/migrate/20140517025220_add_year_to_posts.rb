class AddYearToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :year, :integer
  end
end
