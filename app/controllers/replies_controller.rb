class RepliesController < ApplicationController
 before_action :authenticate_user!
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
    .merge(user: current_user)
  end
end
