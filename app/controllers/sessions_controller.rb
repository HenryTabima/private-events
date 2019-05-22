class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to signin_path
  end
end
