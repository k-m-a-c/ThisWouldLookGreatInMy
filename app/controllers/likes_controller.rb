class LikesController < ApplicationController

  def request(photo_id)
    client = F00px::Client.new
    client.token = current_user.token
    client.token_secret = current_user.token_secret

    response = F00px.post('/photos/#{ photo_id }/like')
    puts response.body
  end

  def create(photo_id)
    request(photo_id)
    redirect_to :back
  end
end
