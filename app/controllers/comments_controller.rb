class CommentsController < ApplicationController
    before_action :set_commentable
    before_action :set_comment, only: %i[ update destroy]
    before_action :authenticate_user!

    def index
      debugger
      @comments = @commentable.comments
  
      render json: @comments
    end

    def create
      @comment = Comment.new(comment_params.merge({user: current_user, commentable: @commentable}))
        if @comment.save
          render json: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
      end    
    end

    def update
      if @comment.update(comment_params.merge({commentable: @commentable}))
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end

    def set_commentable

      @commentable = if params["comment"]["publication_id"]
                        Publication.find(params["comment"]["publication_id"])
                      elsif params["comment"]["comment_id"]
                        Comment.find(params["comment"]["comment_id"])
                      end
    end

    def comment_params
        params.require(:comment).permit(:comment)
    end
end
    #   def set_comment
    #       @comment = Comment.find(params[:id])
    #   end
  
    #   def set_publication
    #     debugger
    #     @publication = Publication.find(params[:publication_id])
    # end