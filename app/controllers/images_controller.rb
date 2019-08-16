class ImagesController < ApplicationController
  def index
    @tags = Image.tag_counts.map(&:name)
    if params[:tag].present?
      @selected = params[:tag]
      @images = Image.order(created_at: :desc).tagged_with(@selected.split(';'), any: true)
    else
      @selected = ''
      @images = Image.order(created_at: :desc)
    end
  end

  def destroy
    image = Image.find_by(id: params[:id])
    image.destroy if image.present?
    redirect_to images_path
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
    params.require(:image).permit(:url, :tag_list)
  end
end
