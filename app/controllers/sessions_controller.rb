class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_path, success: "Vous êtes connecté batard!"
    else
    redirect_to new_session_path, notice: 'Invalid email/password combination'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Vous êtes déconnecté"
  end
end
