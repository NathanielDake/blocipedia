class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit

  before_action :authenticate_user!

  protect_from_forgery with: :exception


  private

  def user_not_authorized
    flash[:alert] = "You must be an admin to do that"
    redirect_to (request.referrer || root_path )
  end

  def require_sign_in
    unless current_user
      flash[:alert] = "You must be logged in to do that"
      redirect_to new_session_path
    end
  end

end
