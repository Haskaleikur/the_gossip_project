class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
    # GET /comments
    # GET /comments.json
    def index
      gossip = Gossip.find(params[:gossip_id])
      @comments = gossip.comments
    end
  
    # GET /comments/1
    # GET /comments/1.json
    def show
    end
  
    # GET /comments/new
    def new
      @comment = Comment.new
    end
  
    # GET /comments/1/edit
    def edit
    end
  
    # POST /comments
    # POST /comments.json
    def create
      @comment = Comment.new(comment_params)
  
      respond_to do |format|
        if @comment.save
          format.html { redirect_to gossip_path(params[:gossip_id]), notice: 'Ton commentaire a bien été ajouté' }
          format.json { render :show, status: :created, location: @comment }
        else
          format.html { render 'gossips/#{params[:gossip_id]}' } #Pas sûr que cela fonctionne
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /comments/1
    # PATCH/PUT /comments/1.json
    def update
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
          format.json { render :show, status: :ok, location: @comment }
        else
          format.html { render :edit }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end