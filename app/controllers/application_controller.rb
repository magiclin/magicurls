class ApplicationController < ActionController::Base
  before_filter :authorize, :except => :login
  protect_from_forgery


private
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = 'Please login'
      redirect_to :controller => 'admin', :action => 'login'
    end
  end
end
