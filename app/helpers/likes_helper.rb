module LikesHelper
  def already_exist?(gossip)
    @gossip = gossip
    Like.where(user: current_user, gossip_id: @gossip.id).length > 0
  end
end
