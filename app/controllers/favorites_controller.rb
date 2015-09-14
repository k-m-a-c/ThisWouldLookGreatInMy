class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.f00px(current_user.id, params[:photo_id])
    redirect_to :back, notice: "Favorited!"
  end
end
