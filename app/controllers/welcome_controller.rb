class WelcomeController < ApplicationController
  layout "welcome"
  def index
    @posts= Post.all.order('created_at DESC').limit(6)
  end
end
