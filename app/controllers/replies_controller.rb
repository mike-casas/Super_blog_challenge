class RepliesController < ApplicationController

  def index

  end

  def new

  end
  def show
  end
  def create
    @coment= Coment.find(params[:coment_id])
    @coment.replies.create(params_reply)

    redirect_to request.referrer || root_url
  end
  def destroy

  end

  private
  def params_reply
    params.require(:reply).permit(:description)
  end
end
