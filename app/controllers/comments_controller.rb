class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post
    def create
        @comment = @post.comments.create(comment_params)
        @comment.user = current_user

        if @comment.save
            redirect_to post_path(@post), notice: "Comment has been created successfully";
        else
            redirect_to post_path(@post), alert: "Comment couldn't be saved";
        end
    end

    def destroy
        if @post.comments.find(params[:id]).destroy
            redirect_to post_path(@post), notice: "Comment has been deleted successfully";
        else
            redirect_to post_path(@post), alert: "Comment couldn't be deleted";
        end
    end

    private
    def set_post
        @post = Post.find(params[:post_id])
    end

    private
    def comment_params
        params.require(:comment).permit(:body)
    end
end
