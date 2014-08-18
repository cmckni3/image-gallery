class HomeController < ApplicationController
  def index
    @recent_galleries = Gallery.includes(:images).order("created_at desc").limit(5)
  end
end
