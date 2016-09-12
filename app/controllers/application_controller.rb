class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def catch_not_found
    raise ActionController::RoutingError.new("Photo Not Found")
  end

end
