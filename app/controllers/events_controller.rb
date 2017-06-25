class EventsController < ApplicationController
  before_action :authorize_actions

  def index
    events = Event.fresh.ok.order("starts_at desc")

    render json: events
  end

  private

  def event
    @event = params[:id] ? Event.find_by!(id: params[:id]) : Event.new(event_params)
  end

  def event_params
    params.require(:event).permit(:name, :description, :starts_at, :ends_at, :event_type_id, :lat, :lng, :location)
  end

end
