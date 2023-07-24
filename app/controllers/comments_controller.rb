class CommentsController < ApplicationController
    before_action :set_comment, :only %i[ update destroy] 
    def index
      @comments = Comment.all
  
      render json: @comments
    end

    def create
        @comment = Comment.new(comment_params)
          if @comment.save
            render json: @comment
          else
            render json: @publication.errors, status: :unprocessable_entity
        end    
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(comment).find(:comment)
    end
end