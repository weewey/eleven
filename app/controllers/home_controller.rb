class HomeController < ApplicationController
  NUM_FEATURED_RACES = 8

  def index
    @featured_races = Race.order(start_date: :desc).limit(NUM_FEATURED_RACES)
    render :index
  end
end
