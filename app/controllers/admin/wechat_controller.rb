class Admin::WechatController < AdminController
  def index
    @images = WechatImage.all 
  end
  def show
    @image = WechatImage.find(params[:id])
  end
  def destroy
    @image = WechatImage.find(params[:id])
    if @image.destroy
      redirect_to admin_wechat_index_path
    end
  end
end
