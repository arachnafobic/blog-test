class PostsController < ApplicationController

  before_filter :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
    expires_in(60.seconds, public: true)
  end

  def show
    expires_in(60.seconds, public: true)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :text))
    @post.slug = to_param
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @post.slug = to_param
    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  protected
    def find_post
      @post = Post.find(Slug[params[:id]])
      rescue ActiveRecord::RecordNotFound
        redirect_to posts_path
    end

end
