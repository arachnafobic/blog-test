class PostsController < ApplicationController

  before_filter :find_post, except: [:index, :new]

  def index
    @posts = Post.all
  end

  def show
#    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # In Rails 4.x it should be like this:
    # @post = Post.new(params[:post].permit(:title, :text))
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
#    @post = Post.find(params[:id])
  end

  def update
#    @post = Post.find(params[:id])

    # In Rails 4.x it should be like this:
    # if @post.update(params[:post].permit(:title, :text))
    if @post.update_attributes(params[:post])
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
#    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  protected
    def find_post
      @post = Post.find(Slug[params[:id]])
#      rescue ActiveRecord::RecordNotFound
#        redirect_to posts_path
    end

end
