class QaThreadsController < ApplicationController
  def new
    @qa_thread = session[:qa_thread] ? QaThread.new(session[:qa_thread]) : QaThread.new
  end

  def confirm
    @qa_thread = QaThread.new(qa_thread_params)
    # TODO: validation check
    session[:qa_thread] = @qa_thread
  end

  def create
    qa_thread = current_user.qa_threads.new(session[:qa_thread])
    qa_thread.save
    # TODO: Thanks modal
    redirect_to qa_thread_path(qa_thread)
  end

  def show
    @qa_thread = QaThread.find(params[:id])
    @qa_replies = @qa_thread.replies.directly_below.eager_load(:replies)
    @qa_reply = @qa_thread.replies.new
  end

  private

  def qa_thread_params
    params.require(:qa_thread).permit(:title, :carrier, :terminal, :content)
  end
end
