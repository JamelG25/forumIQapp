class ForumThreadsController < ApplicationController

  def index
    @q = ForumThread.search(params[:q])
    @forum_threads = @q.result(distinct: true)
    #ForumThread.all change to @.result
  end



  def show
    @forum_thread = ForumThread.find(params[:id]) || ForumThread.new
    @forum_post = ForumPost.new
  end

  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.new
  end

  def create
    @forum_thread = current_user.forum_threads.new forum_thread_params
    @forum_thread.forum_posts.first.user_id = current_user.id

    if @forum_thread.save
      redirect_to @forum_thread
    else
      render action: :new
    end
  end

  def edit
    @forum_thread = ForumThread.find(params[:id])
  end

  def update
    params[:id]
    forum_thread = ForumThread.find(params[:id])
    if forum_thread.update_attributes(params.require(:forum_thread).permit(:subject))
      redirect_to forum_threads_path
    else
      render :edit
    end
  end

  def destroy
    @forum_thread = ForumThread.find(params[:id])
    @forum_thread.destroy
    redirect_to forum_threads_path
  end


  private

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:id])
  end

  def forum_thread_params
    params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])
  end




end