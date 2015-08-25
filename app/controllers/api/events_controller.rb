class API::EventsController < ApplicationController

  # RRM How to properly handle this in production?
  skip_before_action :verify_authenticity_token

  before_action :set_access_control_headers

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    if registered_application.nil?
      render json: "Unregistered application", status: :unprocessable_entity
    else
      event = registered_application.events.new(event_params)

      if event.save
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    end
  end

private

  def event_params
    params.permit(:name)
  end

  # Set CORS response headers
  # http://arnab-deka.com/posts/2012/09/allowing-and-testing-cors-requests-in-rails
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

end