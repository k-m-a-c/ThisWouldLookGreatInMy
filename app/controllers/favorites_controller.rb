class FavoritesController < ApplicationController
  before_filter :authenticate_user!
  def create
    # keep the controller thin by moving the API request
    # and response cycle to the model
    @favorite = Favorite.f00px_favorite(current_user.id, params[:photo_id])
    redirect_to :back, notice: "Favorited!"
  end

  def delete
    @favorite = Favorite.f00px_un_favorite(current_user.id, params[:photo_id])
    redirect_to :back, notice: "Favorite deleted!"
  end
end
