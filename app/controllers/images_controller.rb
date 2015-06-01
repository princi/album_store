class ImagesController < ApplicationController
  before_action :set_album, only: [:index, :new, :create, :destroy, :edit, :update]
  before_filter :user_authorize, only: [:new, :edit]
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
      redirect_to album_path(@image.album.id), notice: "The image #{@image.name} has been uploaded."
    else
      render "new"
    end
  end

  def update
    @image = @album.images.find(params[:id])
    @image.update(image_params)
    redirect_to album_path(@image.album.id)
  end


  def destroy
    @album = Album.find(params[:album_id])
    @image = @album.images.find(params[:id])
    @image.destroy
    redirect_to album_path(@image.album.id), notice:  "The image #{@image.name} has been deleted."
  end

private
  def image_params
    params.require(:image).permit(:name, :attachment, :album_id)
  end

  def set_album
    @album = Album.find(params[:album_id])
  end
  def user_authorize
    if current_user != @album.user
      redirect_to root_path, notice: "Sorry you can't authorize."
    end
  end

end
