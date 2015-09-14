class FavoritesController < ApplicationController
  def create
    photo_id = params[:photo_id]
    client = F00px::Client.new
    client.token = current_user.token
    client.token_secret = current_user.token_secret

    response = client.post("photos/#{ photo_id }/favorite")
    puts "500px Response: " + response.body

    if response.body.include? "\"status\":200"
      redirect_to :back, notice: "Favorited the photo!"
    else
      redirect_to :back, notice: "Woops. Something went wrong on our side."
    end
  end
end
