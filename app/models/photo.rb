class Photo
  require 'json'

  attr_accessor :provider_id, :name, :width, :height, :for_sale, :nsfw,
    :favorited, :image_url, :author_full_name, :author_image

  def initialize(params)
    @provider_id = params['id']
    @name = params['name']
    @width = params['width']
    @height = params['height']
    @for_sale = params['for_sale']
    @nsfw = params['nsfw']
    @favorited = params['favorited']
    @image_url = params['image_url']
    @author_full_name = params['user']['fullname']
    @author_image = params['user']['userpic_url']
  end

  def self.popular(user_id)
    begin
      user = User.find(user_id)

      client = F00px::Client.new
      client.token = user.token
      client.token_secret = user.token_secret

      # build url to get popular photos
      feature = "feature=popular"
      sorting = "&sort=rating&rpp=100&image_size=4&include_store=store_print&include_states=favorited"
      composed_url = "photos?#{ feature }#{ sorting }"

      response = client.get(composed_url)
      hash = JSON.parse(response.body)

      hash['photos'].map{ |photo|
        Photo.new(photo)
      }
    rescue StandardError => e
      flash[:error] = [e.message]
    end
  end
end
