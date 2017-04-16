class EventsController < ApplicationController
  before_action :authorize_actions

  def index
    @events = Event.all

    render json: @events
  end

end
