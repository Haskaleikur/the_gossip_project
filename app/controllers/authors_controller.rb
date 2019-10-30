class AuthorsController < ApplicationController

def show
    @id = params[:id]
    @user = User.find(@id)
    @city = @user.city
    end

end