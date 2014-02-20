class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.public
  end

  def new
    @post = Post.new
  end
  
  def post
    @post = Post.new(params[:post])
  end
  
  def update
  end

  def show
    @post = Post.find params[:id]
    unless can? :read, @post
      raise ActiveRecord::RecordNotFound
    end
  end
  
  def delete
  end
end
