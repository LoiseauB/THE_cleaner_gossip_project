class CommentsController < ApplicationController
  before_action :authenticate_user
  def edit
    @comment = Comment.find(params[:id])
    @gossip = @comment.gossip
  end
    
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.create('user_id' => 11, 'gossip_id' => params[:id], 'content' => params[:comment].values_at(:content).split.join(" "))
    redirect_to gossip_path(@gossip)
  end
    
  def update    
    @comment = Comment.find(params[:id])
    if @comment.update(update_params)
      redirect_to gossip_path(@comment.gossip.id)
    else
      render "edit"
    end
  end
    
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip.id)
  end
    
  private
    
  def update_params
    params.require(:comment).permit(:content)
  end
  
end
