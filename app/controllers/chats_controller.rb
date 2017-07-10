class ChatsController < ApplicationController
  before_action :authenticate_user!
  def index
    @chats = Chat.where(sender: current_user.username).or(Chat.where(receiver: current_user.username))
  end

  def new
    @chat = current_user.chats.build
  end

  def create
    @chat = current_user.chats.build(chat_params)
    if User.find_by(username: params[:chat][:receiver])
      if @chat.save
        redirect_to @chat
      else
        render 'new'
      end
    else
      @chaterror = 'Can\'t find receiver'
      render 'new'
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

  private

  def chat_params
    params.require(:chat).permit(:sender, :receiver)
  end

  def find_chat
    @chat = Chat.find(params[:id])
  end
end
