class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
  end

  def create
    @event = current_user.events.build(tweeet_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
end
