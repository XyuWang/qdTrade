class HomeController < ApplicationController
  def index
    @posts = Post.public
  end
end
