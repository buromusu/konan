class AddUrlToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :url, :string
  end
end
