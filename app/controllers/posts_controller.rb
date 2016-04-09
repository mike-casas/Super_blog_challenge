class PostsController < ApplicationController
  before_action :find_post, only: [:show,:edit,:update,:destroy]
  def index
   @posts= Post.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @post= Post.new
  end

  def create
    @post=Post.create(post_params)
    if @post.save
      flash[:exito]= "Creado con Exito"
      redirect_to  @post
    else
      render 'new'
    end
  end

  def show
  end

  def edit


  end


  def update
    @post.update_attributes(post_params)
    if @post.save
      flash[:exito]= "Actualizado con exito"
      redirect_to @post
    else
      render 'show'
    end
  end

  def destroy
    @post.destroy
    flash.now[:danger]="Eliminado con exito"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title,:description)
  end
  def find_post
    @post= Post.find(params[:id])
  end

end
