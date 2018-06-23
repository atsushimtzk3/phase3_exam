class BlogsController < ApplicationController
  
  before_action :logged_in?
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :list]
  
  def index
    @blogs = Blog.all
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
       # 一覧画面へ遷移して"つぶやきを作成しました！"とメッセージを表示します。
       redirect_to blogs_path, notice: "つぶやきを作成しました！"
    else
       # 入力フォームを再描画します。
       render 'new'
    end
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  
  def show
  end
  
  def edit
  end
  
  def top
  end
  
  def update
    if @blog.update(blog_params)
       redirect_to blogs_path, notice: "つぶやきを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"つぶやきを削除しました！"
  end

  private
  def blog_params
    params.require(:blog).permit(:content)
  end
  
  # idをキーとして値を取得するメソッド
    def set_blog
      @blog = Blog.find(params[:id])
    end
  
end
