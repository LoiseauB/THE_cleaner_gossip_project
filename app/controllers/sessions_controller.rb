class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      if params[:remember] == "yes"
      remember(user)
      end
    
      redirect_to root_path, success: "Vous êtes connecté batard!"
    else
      redirect_to new_session_path, notice: 'Invalid email/password combination'
    end
  end

  def destroy
    log_out(current_user)
    redirect_to root_path, notice: "Vous êtes déconnecté"
  end

end
