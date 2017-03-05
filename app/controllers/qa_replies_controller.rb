class QaRepliesController < ApplicationController
  def create
    qa_reply = current_user.qa_replies.new(qa_reply_params)
    qa_reply.save

    redirect_to qa_thread_path(qa_reply.qa_thread)
  end

  private

  def qa_reply_params
    params.require(:qa_reply).permit(:qa_thread_id, :qa_reply_id, :content)
  end
end
