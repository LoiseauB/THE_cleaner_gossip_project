module GossipsHelper
  def is_owner?
    @gossip.user == current_user
  end

  def authenticate_user
    unless current_user
      redirect_to new_session_path, notice: "Please log in."
    end
  end

end
