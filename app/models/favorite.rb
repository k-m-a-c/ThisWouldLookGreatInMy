class Favorite < ActiveRecord::Base
  attr_accessor :uid

  def self.f00px(user_id, photo_id)
    begin
      user = User.find(user_id)

      client = F00px::Client.new
      client.token = user.token
      client.token_secret = user.token_secret

      response = client.post("photos/#{ photo_id }/favorite")

      favorite = Favorite.new(photo_uid: photo_id)
      favorite.save
      return favorite
    rescue
      "An error occurred"
    end
  end
end
