class AddAvatarToWechatImage < ActiveRecord::Migration[5.0]
  def change
    add_column :wechat_images, :avatar,:string
  end
end

