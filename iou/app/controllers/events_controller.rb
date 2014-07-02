class EventsController < ApplicationController
  def new

  end

  def create
    @event = Event.create(:user_id=> current_user.id, :name => params[:name], :pay_date => params[:pay_date], :friend=> params[:friend], :amount=> params[:amount], :status=>"pending")
    redirect_to "/users/#{current_user.id}/events/#{@event.id}"

  end

  def paid
    @id = params[:event_id]
    @event = Event.find(@id)
    @event.status = "paid"
    @event.save
    redirect_to "/users/#{current_user.id}/events/#{@event.id}"

  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = current_user.events
  end
end
