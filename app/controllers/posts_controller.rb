class PostsController < ApplicationController
    before_action :authenticate_user!
  def create
    post = Post.new(post_params)
    if post.save
      redirect_to meetup_path(post.meetup)
    end
  end
  def destroy
    
  end

  private
  def post_params
    params.require(:post).permit(:content,:meetup_id)
  end
end
