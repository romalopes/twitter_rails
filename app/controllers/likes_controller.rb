class LikesController < ApplicationController
  before_action :set_post
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user.id)
    # redirect_to @post
    render turbo_stream: turbo_stream.replace("like-session-#{@post.id}", partial: "posts/like_session", locals: { post: @post })
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.likes.find_by(user_id: current_user.id).destroy
    render turbo_stream: turbo_stream.replace("like-session-#{@post.id}", partial: "posts/like_session", locals: { post: @post })
  end


  private
  def set_post
    @post = Post.find(params.expect(:post_id))
  end
end
