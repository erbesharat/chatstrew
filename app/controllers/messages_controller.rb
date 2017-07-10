class MessagesController < ApplicationController
  def new
    @message = Chat.find(message_params[:chat_id]).messages.build
  end

  def create
    @message = Chat.find(message_params[:chat_id]).messages.build(message_params)
    if @message.save
      redirect_to Chat.find(@message.chat_id)
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :author, :chat_id)
  end
end
