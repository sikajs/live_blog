class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comments_params)
    @comment.author = current_author

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: "Successfully commented on post" }
        format.js { }
      else
        format.html { render :new, notice: "Something went wrong" }
      end
    end
  end

  private
    def comments_params
      params.require(:comment).permit(:content)
    end
end
