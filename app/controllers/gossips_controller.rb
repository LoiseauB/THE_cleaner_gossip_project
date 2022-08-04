class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit, :show]
  def show
        @gossip = Gossip.find(params[:id])
        @comments = @gossip.comments
  end
    
  def new
      
  end
    
  def create
    @gossip = Gossip.new('user' => current_user, 'title' => params[:title],'content' => params[:content])
    if @gossip.save
      @gossips = Gossip.all
      render "index" 
    else
      render "new" 
    end    
  end
    
  def index
    @gossips = Gossip.all
  end

  def edit
    @gossip = Gossip.find(params[:id])
    if is_owner?
    else
      redirect_to root_path, notice: "Vous n'avez pas accès à cette page"
    end
  end
      
  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(update_params)
      @gossips = Gossip.all
      render "index" 
    else
      render "edit"
    end
  end
    
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end
    
  def shallow
    @comment = @comment.new(shallow: true)
    yield
  ensure
    @comment = @comment.parent
  end

  private

  def update_params
    params.require(:gossip).permit(:title, :content)
  end
    
end
