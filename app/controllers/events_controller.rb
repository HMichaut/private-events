class EventsController < ApplicationController
  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit!
  end

  # def past
  #   Event.all.where("DATE(date) < ?", Date.today)
  # end

  # def upcoming
  #   Event.all.where("DATE(date) >= ?", Date.today)
  # end
end
