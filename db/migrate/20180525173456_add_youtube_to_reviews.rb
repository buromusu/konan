class AddYoutubeToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :youtube, foreign_key: true
  end
end
