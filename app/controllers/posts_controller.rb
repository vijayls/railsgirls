class PostsController < ApplicationController


  def new
    authenticate_admin!
    @post = Post.new()
  end

  def create
    authenticate_admin!
    @post = Post.new(:title => params[:post][:title], :text => params[:post][:text])
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html{

      }
      format.json{
        render :json => @post.to_json
      }
    end

  end

  def index
    @posts = Post.all
  end

  def edit
    authenticate_admin!
    @post = Post.find(params[:id])
  end

  def update
    authenticate_admin!
    @post = Post.find(params[:id])

    if @post.update_attributes!(:title => params[:post][:title], :text =>  params[:post][:text])
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    authenticate_admin!
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

end