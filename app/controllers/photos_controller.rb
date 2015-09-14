class PhotosController < ApplicationController

  def index
    @photos = Photo.get_photos
  end

  def show
  end
end
