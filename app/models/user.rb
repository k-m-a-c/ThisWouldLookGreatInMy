class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    user = find_by(:provider => 'fiveHundredPx', :uid => auth['uid']) || create_from_omniauth(auth)
    if user
      # update access token each time so that it doesn't expire
      user.token = auth['credentials']['token']
      user.token_secret = auth['credentials']['secret']
      user.save
    end
    return user
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = 'fiveHundredPx'
      user.uid = auth['uid']
      user.email = auth['info']['email']
      user.name = auth['info']['name']
      user.image = auth['info']['image']
      user.token = auth['credentials']['token']
      user.token_secret = auth['credentials']['secret']
    end
  end

end
