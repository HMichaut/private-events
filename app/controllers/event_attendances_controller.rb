class EventAttendancesController < ApplicationController
  def new
    @event_attendance = EventAttendance.new
  end

  def create
    @event_attendance = current_user.event_attendances.build(event_attendance_params)
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
