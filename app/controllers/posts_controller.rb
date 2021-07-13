class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.find_by(params[:id])
    @posts = Post.all.order("created_at DESC")
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save

    redirect_to root_path
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to post_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def post_params
    params.require(:post).permit(:comment)
  end
end