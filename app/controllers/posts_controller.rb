class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def show
  end

  def update
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to @post
    else
      render root_url
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
