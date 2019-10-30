class HomeController < ApplicationController
    def index
        @identifiant = params[:identifiant]
        if @identifiant != nil
         else
           render 'index'
         end
    end
end
