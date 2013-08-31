class AddCategoryIdToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :category_id, :integer
    add_column :urls, :score, :integer, :default => 0
  end

end
