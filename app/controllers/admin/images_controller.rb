class Admin::ImagesController < AdminController
  def index
    @images = Image.all
  end
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save!
      redirect_to admin_image_path(rand(1..2))
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id]) # 上传后随机调出一张照片
  end

  private

  def image_params

    params.require(:image).permit(:avatar)
  end
end
