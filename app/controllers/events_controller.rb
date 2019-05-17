class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def index
    @events = Event.all
    @upcoming_events =  Event.upcoming
    @previous_events = Event.past

  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :event_date)
  end
end
