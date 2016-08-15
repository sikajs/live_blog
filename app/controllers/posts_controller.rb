class PostsController < ApplicationController
  before_action :authenticate_author!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:author).paginate(:page => params[:page], :per_page => 15).recent
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.author = current_author

    if @post.save
      flash[:success] = "Post successfully created"
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(posts_params)
      flash[:success] = "Post successfully updated"
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post successfully deleted"
    redirect_to root_path
  end

  private
    def posts_params
      params.require(:post).permit(:title, :content)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
