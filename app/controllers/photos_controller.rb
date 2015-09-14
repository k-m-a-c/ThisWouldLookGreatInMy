class PhotosController < ApplicationController
  def index
    @photos = Photo.popular(current_user.id)
  end
end
