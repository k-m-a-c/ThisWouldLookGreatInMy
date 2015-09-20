class PhotosController < ApplicationController
  before_filter :authenticate_user!
  def index
    @photos = Photo.popular(current_user.id)
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def buy
    @photo = Photo.find(params[:id])
  end
end
