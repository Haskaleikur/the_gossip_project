class UserController < ApplicationController
    
    def index
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(first_name: params[:prénom], last_name: params[:nom], age: params[:âge], email: params[:email], password: params[:password], city_id: rand(1..20)) 

        if @user.save # essaie de sauvegarder en base @gossip
           redirect_to gossips_path
        else
          render 'new'
        end
    end
end
