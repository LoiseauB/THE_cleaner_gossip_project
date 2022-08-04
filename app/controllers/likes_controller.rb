class LikesController < ApplicationController
  before_action :find_gossip
  
  def create
    if already_exist?(@gossip)
      redirect_back(fallback_location: root_path)
    else
      @gossip.likes.create(user: current_user)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @like = find_like
    if already_exist?(@gossip)
      @like.destroy_all
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end

  def find_like
    Like.where(user: current_user, gossip_id: @gossip.id)
  end  

end
