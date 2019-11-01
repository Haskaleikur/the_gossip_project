class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:index]

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
        @gossip = Gossip.create(title: params[:title], content: params[:body], user_id: 31)
        @gossip.user = User.find_by(id: session[:user_id])
        if @gossip.save
          flash[:success] = "Potin bien créé !"
          redirect_to gossips_path
        else
          render :new
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
        JoinTableGossipTag.where(gossip_id: @gossip.id).find_each do |gt|
        gt.destroy
        end
        @gossip.destroy
        redirect_to gossips_path
      end

      private

      def authenticate_user
        unless current_user
          flash[:danger] = "Please log in."
          redirect_to new_session_path
        end
      end
end

