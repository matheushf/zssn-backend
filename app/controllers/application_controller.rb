class ApplicationController < ActionController::API
  include ActionController::Serialization

  # before_action :check_header

  private
  def check_header

    if ['GET', 'POST', 'PUT', 'PATCH', 'OPTIONS'].include? request.method
      if request.headers['HTTP_ACCEPT'] != "application/json"
        head 406 and return
      end

    end
  end

  def validate_type
    if params['data'] && params['data']['type']
      if params['data']['type'] == params[:controller]
        return true
      end
    end

    head 409 and return
  end

  private
  def render_error(resource, status)
    render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
  end
end
