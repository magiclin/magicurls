class AdminController < ApplicationController
  def index
  end

  def login
    if request.post?
      user = User.find_by_name(params[:name])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to :action => 'index'
      else
        flash.now[:notice] = 'Invalid user/passwod combination!'
      end
    end
  end

  def logout
    session[:user_id] = nil if session[:user_id]
    redirect_to :action => 'login'
  end
end
