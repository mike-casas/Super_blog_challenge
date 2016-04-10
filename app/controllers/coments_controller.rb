class ComentsController < ApplicationController
before_action :authenticate_user!
  def index
    @post= Post.find(params[:post_id])
  end

  def new
    @coment= Coment.new
  end

  def create
     @post = Post.find(params[:post_id])
    @coment = @post.coments.create(comments_params)
  end

  def update
    @coment= Coment.find(params[:id])
    @coment.update_attributes(comments_params)
  end

  def show
    @post = Post.find(params[:post_id])
    @coment = @post.coments.find(params[:id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @coment = @post.coments.find(params[:id])
  end

  def destroy
   @post = Post.find(params[:post_id])
    @coment = @post.coments.find(params[:id])
    @coment.destroy
  end

  def comments_params
       params.require(:coment).permit(:description)
       .merge(user: current_user)
     end


end
