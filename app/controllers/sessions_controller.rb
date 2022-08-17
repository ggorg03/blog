class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged successfully'
      redirect_to user
    else
      flash.now[:errors] = ['There is some error on email or password']
      render 'new'
    end
  end

  def destroy
  end
end
