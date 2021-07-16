class EventAttendancesController < ApplicationController
  def new
    session[:event_id] = params[:event_id] unless params[:event_id].nil?
    @event = Event.find(session[:event_id])
    @event_attendance = EventAttendance.new
  end

  def create
    @event = Event.find(session[:event_id])
    @event_attendance = EventAttendance.new(attended_event_id: @event.id, attendee_id: current_user.id)

    if @event_attendance.save
      redirect_to @event
    else
      render :new
    end
  end

  private

  def event_attendance_params
    params.require(:event_attendance).permit!
  end
end
