class ChangeStarToYoutubes < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column :youtubes, :star, :integer, default: 3
    end

    #変更前の型
    def down
      change_column :youtubes, :star, :hidden, default: 3
    end
  end
end
