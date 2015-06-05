class ForumThreadsController < ApplicationController

  def index
    @forum_threads = ForumThread.all
  end

  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.new
  end

  def show
     @forum_thread = ForumThread.find(params[:id]) || ForumThread.new
     @forum_post = ForumPost.new
  end

  def create
    @forum_thread = current_user.forum_threads.new forum_thread_params
    @forum_thread.forum_posts.first.user_id = current_user.id

    if @forum_thread.save
      redirect_to forum_threads_path
    else
      render action: :new
    end
  end

  private

  def forum_thread_params
    params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])
  end
end