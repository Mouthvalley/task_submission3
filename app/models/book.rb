class Book < ApplicationRecord
  
  # has_one_attached :profile_image
  
  belongs_to :user

# カリキュラム 11章
  # def get_profile_image
  #   if profile_image.attached?
  #     profile_image
  #   else
  #     'no_image.jpg'
  #   end
  # end
  
end