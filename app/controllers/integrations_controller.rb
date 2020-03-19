class IntegrationsController < ApplicationController
  def webhook
    begin
      payload = JSON.parse(request.body.read)
      action = WebhookService.new(payload).process
    rescue Exception => ex
      render :json => {:status => 400, :error => "Webhook failed"} and return
    end
    render :json => {:status => 200}
  end

end
