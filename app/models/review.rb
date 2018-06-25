class Review < ApplicationRecord
  belongs_to :user
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Review.where(['url LIKE ?', "%#{search}%"])
    else
      Review.all #全て表示。
    end
  end
end
