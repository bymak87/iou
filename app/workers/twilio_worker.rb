require 'dotenv'
Dotenv.load
require 'twilio-ruby'
require 'sidekiq'

class TwilioWorker
  include Sidekiq::Worker

  def perform
    account_sid = ENV['SID']
    auth_token = ENV['TOKEN']
    from = ENV['FROM']
    @id = params[:event_id]
    @event = Event.find(@id)

    # # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    # #send text
    @client.account.messages.create(
    :from => from,
    :to => "+1#{current_user.cellphone}",
    :body => "Remember to pay #{@event.friend} $#{@event.amount}."
    )
    redirect_to "/users/#{current_user.id}/events/#{@event.id}"

  end
end
