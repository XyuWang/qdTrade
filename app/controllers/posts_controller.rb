class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def search
    @posts = Post.public.tire.search(params[:p])
  end
  
  def index
    @posts = Post.public.page params[:page]
    
    if params[:tab]
      @tab = Category.find params[:tab] 
      @posts = @posts.where category_id: @tab
    end
    
    if params[:school]
      @school = School.find params[:school] 
      @posts = @posts.where school_id: @school
    end

  end
  
  def self
    @posts = current_user.posts.where(public: true)
  end
  
  def self_deleted
    @posts = current_user.posts.where(public: false)
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.new(strong_params)
    
    if @post.save
      redirect_to self_posts_path, notice: "成功"
    else
      redirect_to :back, alert: @post.errors.full_messages.to_sentence
    end
  end
  
  def edit
    @post = current_user.posts.find(params[:id])
  end
  
  def update
    @post = current_user.posts.find(params[:id])
    
    if @post.update_attributes! strong_params
      redirect_to self_posts_path, notice: "成功"
    else
      redirect_to :back, alert: @post.errors.full_messages.to_sentence
    end
  end

  def show
    @post = Post.find params[:id]
    
    unless can? :read, @post
      raise ActiveRecord::RecordNotFound
    end
    
    @post.increment!(:hits)
  end
  
  def destroy
    @post = current_user.posts.find(params[:id])
    
    if @post.update_attributes!(public: false)
      redirect_to self_posts_path, notice: "成功"
    else
      redirect_to :back, alert: @post.errors.full_messages.to_sentence
    end
  end
  
  def recover
    @post = current_user.posts.find(params[:id])
    
    if @post.update_attributes!(public: true)
      redirect_to self_posts_path, notice: "成功"
    else
      redirect_to :back, alert: @post.errors.full_messages.to_sentence
    end
  end
  
  
  private
  def strong_params
    params[:post].permit :school_id, :category_id, :title, :content, :contact, :price, :public
  end
end
