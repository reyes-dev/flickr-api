class PagesController < ApplicationController
  require 'flickr'

  def index
    if params.include?(:flickr_id)
      flickr = Flickr.new ENV['flickr_key'], ENV['flickr_secret']
      @photos = flickr.photos.search(user_id: params[:flickr_id])
    else
      @photos = nil
    end
  end
end
