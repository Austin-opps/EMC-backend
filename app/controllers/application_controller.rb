class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  before_action :authenticate_user!
  load_and_authorize_resource # Enable CanCanCan authorization

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end
end
