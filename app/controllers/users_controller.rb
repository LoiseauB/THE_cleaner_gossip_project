class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
  end 

  def create
    @user = User.new('first_name' => Faker::Games::Heroes.name, 'last_name' => Faker::FunnyName.name, 'city' => City.all.sample, 'age' => rand(15..65), 'description' => Faker::Movies::BackToTheFuture.quote, 'email' => params[:email],'password' => params[:password])
    if @user.save
      @gossips = Gossip.all
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end    
  end

  def update
  end

end
