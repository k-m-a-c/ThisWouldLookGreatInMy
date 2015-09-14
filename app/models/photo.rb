class Photo
  include HTTParty
  base_uri 'https://api.500px.com/v1'

  attr_accessor :provider_id, :name, :width, :height, :for_sale, :nsfw,
    :image_url, :author_full_name, :author_image

  def self.api_key
    Figaro.env.consumer_key
  end

  def self.get_photos
    feature = "feature=popular"
    sorting = "&sort=rating&rpp=100&image_size=4&include_store=store_print&include_states=voted"

    # build query using the selected feature and sorting options
    composed_url = "/photos?#{ feature }#{ sorting }&consumer_key=#{ api_key }"

    photos = get(composed_url)['photos']

    # transform each hash into a Ruby object
    photos.map{ |photo| Photo.new(photo) }
  end

  def initialize(params)
    @provider_id = params['id']
    @name = params['name']
    @width = params['width']
    @height = params['height']
    @for_sale = params['for_sale']
    @nsfw = params['nsfw']
    @image_url = params['image_url']
    @author_full_name = params['user']['fullname']
    @author_image = params['user']['userpic_url']
  end

end
