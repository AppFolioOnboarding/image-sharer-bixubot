class ImagesController < ApplicationController
  def index
    @images = Image.order(created_at: :desc)
  end

  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to image_path(@image)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def image_params
    params.require(:image).permit(:url)
  end
end
