class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def show
    @events = current_user.events.order("created_at DESC")
    @event = Event.new
  end

end
