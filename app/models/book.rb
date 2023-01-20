class Book < ApplicationRecord

  has_one_attached :profile_image

  belongs_to :user

# カリキュラム 11章
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end