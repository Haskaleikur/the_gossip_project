class StaticController < ApplicationController
  def team
  end

  def contact
  end

  def welcome
    @params = params[:first_name]
    @users = User.all
    @gossips = Gossip.all
  end

  def gossip_each
    @route = Gossip.user.id
    @id = params[:id]
    @user = User.find(@id)
    @city = @user.city
    puts "Notre params est ici : #{params}"

  end

  def home
  end

  
end
