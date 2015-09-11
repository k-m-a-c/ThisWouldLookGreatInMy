class Photo < ActiveRecord::Base
  include HTTParty
  base_uri 'https://api.500px.com/v1'

  def self.api_key
    Figaro.env.consumer_key
  end

  def self.all
    feature = "feature=popular"
    sorting = "&sort=rating&rpp=100&image_size=4&include_store=store_print&include_states=voted"

    # build query using the selected feature and sorting options
    composed_url = "/photos?#{ feature }#{ sorting }&consumer_key=#{ api_key }"

    get(composed_url)['photos']
  end
end
