class Image < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
end
