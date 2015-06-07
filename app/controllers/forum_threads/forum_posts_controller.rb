class ForumThreads::ForumPostsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_forum_thread



  def create

    @forum_thread = ForumThread.find(params[:forum_thread_id])
    @forum_post = ForumPost.new forum_post_params
    @forum_post.user = current_user
    @forum_thread.forum_posts << @forum_post


    if @forum_thread.save
      redirect_to forum_thread_path(@forum_thread, anchor: "forum_post_#{@forum_post.id}"), notice: "Successfully posted!"
    else
      redirect_to forum_threads_path, alert: "Unable to save your post"
    end
  end

  def edit
    @forum_post = ForumPost.find(params[:post_id])
  end

  def update
    forum_post = ForumPost.find(params[:post_id])
    if forum_post.update_attributes(params.require(:forum_post).permit(:body))
      redirect_to forum_thread_path
    else
      render :edit
    end
  end

  def destroy
    @forum_post = ForumPost.find(params[:id])
    @forum_post.destroy
    redirect_to forum_threads_path
  end


  private

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:forum_thread_id])
  end

  def forum_post_params
    params.require(:forum_post).permit(:body,:forum_thread_id)
  end


end