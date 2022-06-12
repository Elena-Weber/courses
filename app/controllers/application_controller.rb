class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_global_variables, if: :user_signed_in?
  
  after_action :user_active
  
  include PublicActivity::StoreController #save current_user using gem public_activity
  include Pundit::Authorization #authorizes (or limits) users' access
  # protect_from_forgery
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  def set_global_variables
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search)
  end
  
  def user_active
    current_user.try :touch
  end
  
  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
  
end