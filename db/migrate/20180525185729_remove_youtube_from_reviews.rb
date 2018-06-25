class RemoveYoutubeFromReviews < ActiveRecord::Migration[5.0]
  def change
    remove_reference :reviews, :youtube, foreign_key: true
  end
end
