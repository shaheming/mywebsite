class CreateWechatImages < ActiveRecord::Migration[5.0]
  def change
    create_table :wechat_images do |t|
      t.string :media_id

      t.timestamps
    end
  end
end
