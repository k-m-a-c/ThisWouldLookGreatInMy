class Favorite < ActiveRecord::Base
  belongs_to :user

  def self.f00px_favorite(user_id, photo_id)
    begin
      user = User.find(user_id)
      photo_id = photo_id.to_i

      # found the F00px gem after some lurking on
      # 500px's Github org page
      client = F00px::Client.new
      client.token = user.token
      client.token_secret = user.token_secret

      response = client.post("photos/#{ photo_id }/favorite")

      favorite = Favorite.new(photo_uid: photo_id)
      favorite.save
      return favorite
    rescue StandardError => e
      puts [e.message]
    end
  end

  def self.f00px_un_favorite(user_id, photo_id)
    begin
      user = User.find(user_id)
      photo_id = photo_id.to_i

      # found the F00px gem after some lurking on
      # 500px's Github org page
      client = F00px::Client.new
      client.token = user.token
      client.token_secret = user.token_secret

      response = client.delete("photos/#{ photo_id }/favorite")

      favorite = Favorite.find_by(user_id: user.id, photo_uid: photo_id)
      favorite.delete
    rescue StandardError => e
      puts [e.message]
    end
  end
end
