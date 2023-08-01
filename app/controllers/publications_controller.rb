class PublicationsController < ApplicationController
  before_action :set_publication_update, only: %i[ update destroy ]
  before_action :authenticate_user!

  # GET /publications
  def index
    
    @publications = Publication.all.page(params[:page])
    paginate json: @publications, meta: {total: (Publication.count)}
  end

  # GET /publications/1
  def show
    @publication = Publication.find(params[:id])

    render json: @publication   
  end

  # POST /publications
  def create
    current_user_id = {user_id: current_user.id}
    @publication = Publication.new(publication_params.merge(current_user_id))
    if @publication.save
      render json: @publication, include: [:user], status: :created, location: @publication
    else
      render json: @publication.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /publications/1
  def update
    if @publication.update(publication_params)
      render json: @publication
    else
      render json: @publication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /publications/1
  def destroy
    @publication.destroy
  end

  private

    def set_publication_update
      @publication = Publication.where(user_id: current_user.id).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publication_params
      params.require(:publication).permit(:title, :description)
    end
end
