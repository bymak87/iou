class EventsController < ApplicationController
  def new

  end

  def create
    @event = Event.create(:name => params[:name], :pay_date => params[:pay_date])
    redirect_to "/users/#{current_user.id}/events/#{@event.id}"
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end
end
