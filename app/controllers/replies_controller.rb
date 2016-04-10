class RepliesController < ApplicationController
 before_action :authenticate_user!
  def create
    @reply_description= params_reply[:description]
    @reply_owner= params_reply[:user][:name]
    @coment= Coment.find(params[:coment_id])
    @coment.replies.create(params_reply)
    # redirect_to request.referrer || root_url
  end
  private
  def params_reply
    params.require(:reply).permit(:description)
    .merge(user: current_user)
  end
end
