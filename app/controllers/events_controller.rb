class EventsController < ApplicationController
  def webhook
    begin
      event = JSON.parse(request.body.read)
      puts event
    rescue Exception => ex
      render :json => {:status => 400, :error => "Webhook failed"} and return
    end
    render :json => {:status => 200}
  end
end
