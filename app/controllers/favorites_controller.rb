class FavoritesController < ApplicationController
  def create
    # keep the controller thin by moving the API request
    # and response cycle to the model
    @favorite = Favorite.f00px(current_user.id, params[:photo_id])
    redirect_to :back, notice: "Favorited!"
  end
end
