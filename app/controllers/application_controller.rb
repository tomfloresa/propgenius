class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_owner_administrator_renter
    if !administrator_signed_in? || !renter_signed_in? || !owner_signed_in?
      authenticate_renter!
    end
  end
end
