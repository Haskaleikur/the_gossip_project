class GossipsController < ApplicationController
    
    def index
      @first_name = params[:identifiant]
      @users = User.all
      @gossips = Gossip.all
      end
    
      def show
        @gossip = Gossip.find(params[:id])
      end
    
      def new
        @gossip = Gossip.new
      end
    
      def create

        @gossip = Gossip.new(title: params[:title], content: params[:body], user_id: 31) 

        if @gossip.save # essaie de sauvegarder en base @gossip
           redirect_to gossips_path
        else
          render 'new'
        end

      end
    
      def edit
        @gossip = Gossip.find(params[:id])
      end
    
      def update

        @gossip = Gossip.find(params[:id])
        gossip_params = params.require(:gossip).permit(:title, :content)
        @gossip.update(gossip_params)
        redirect_to gossips_path

      end
    
      def destroy

        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to gossips_path

      end
end
