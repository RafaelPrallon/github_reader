class EventsController < ApplicationController
  before_action :set_event
  def index
    @events = Event.all
  end

  def show;  end

  def webhook
    begin
      event = JSON.parse(request.body.read)
      puts event
    rescue Exception => ex
      render :json => {:status => 400, :error => "Webhook failed"} and return
    end
    render :json => {:status => 200}
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
