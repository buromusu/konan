class AddStarToYoutubes < ActiveRecord::Migration[5.0]
  def change
    add_column :youtubes, :star, :hidden, default: 3
  end
end
