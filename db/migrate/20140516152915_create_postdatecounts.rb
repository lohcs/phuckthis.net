class CreatePostdatecounts < ActiveRecord::Migration
  def change
    create_table :postdatecounts do |t|
      t.integer :month
      t.integer :year
      t.integer :postcount

      t.timestamps
    end
  end
end
