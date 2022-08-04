class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @gossips = all_gossips
  end

  private

  def all_gossips
    @city = City.find(params[:id])
    users = @city.users
    gossips = []
    users.each do |user|
      gossips << user.gossips
    end
    return gossips.flatten
  end
end
