class PhotosController < ApplicationController
  before_filter :authenticate_user!
  def index
    @photos = Photo.popular(current_user.id)
  end
end
