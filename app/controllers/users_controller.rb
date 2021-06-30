class UsersController < ApplicationController
  has_many :organisations, foreign_key: "creator_id", class_name: "Event"

  def show
    @events = current_user.organisations.order("created_at DESC")
    @event = Event.new
  end

end
