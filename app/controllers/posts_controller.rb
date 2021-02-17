class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :search_product


  def index
    @posts = Post.includes(:user).order(created_at: :DESC)
  end

  def new
    @post = Post.new
    @ingredients = @post.ingredients.build
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def search
    return nil if @search == ""
      @results = @search.result.includes(:ingredients)
 
  end

  private

  def search_product
    @search = Post.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def search_params
    params.require(:q).permit(:title_cont, :ingredients_topping_cont)
  end

  def post_params
    params.require(:post).permit(:title, :description, :image, :cooking_time_id, ingredients_attributes: [:topping, :gram, :_destroy]). merge(user_id: current_user.id)
  end

end
