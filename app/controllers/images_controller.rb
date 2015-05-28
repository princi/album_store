class ImagesController < ApplicationController
  before_action :set_album, only: [:index, :new, :create, :destroy, :edit, :update]

  def index
    @images = @album.images.all
  end

  def new
    @image = @album.images.build
  end

  def edit
    @image = @album.images.find(params[:id])
  end

  def create
    @image = @album.images.build(image_params)

    if @image.save
      redirect_to album_images_path, notice: "The image #{@image.name} has been uploaded."
    else
      render "new"
    end
  end

  def update
    @image = @album.images.find(params[:id])
    @image.update(image_params)
    redirect_to album_images_path
  end


  def destroy
    @album = Album.find(params[:album_id])
    @image = @album.images.find(params[:id])
    @image.destroy
    redirect_to album_images_path(@album), notice:  "The image #{@image.name} has been deleted."
  end

private
  def image_params
    params.require(:image).permit(:name, :attachment, :album_id)
  end

  def set_album
    @album = Album.find(params[:album_id])

  end

end
