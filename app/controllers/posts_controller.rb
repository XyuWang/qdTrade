class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.public
  end
  
  def self_index
    @posts = current_user.posts
  end

  def new
  end
  
  def create
    @post = current_user.posts.new(strong_params)
    
    if @post.save
      redirect_to posts_self_index_path, notice: "成功"
    else
      redirect_to :back, alert: "失败"
    end
  end
  
  def edit
    @post = current_user.posts.find(params[:id])
  end
  
  def update
    @post = current_user.posts.find(params[:id])
    
    if @post.update_attributes! strong_params
      redirect_to posts_self_index_path, notice: "成功"
    else
      redirect_to :back, alert: "失败"
    end
  end

  def show
    @post = Post.find params[:id]
    
    unless can? :read, @post
      raise ActiveRecord::RecordNotFound
    end
  end
  
  def destroy
    @post = current_user.posts.find(params[:id])
    
    if @post.destroy
      redirect_to posts_self_index_path, notice: "成功"
    else
      redirect_to :back, alert: "失败"
    end
  end
  
  private
  def strong_params
    params[:post].permit :school_id, :category_id, :title, :content, :contact, :price, :public
  end
end
