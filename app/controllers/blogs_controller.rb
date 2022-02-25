class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy] 
  def index
    @blogs=Blog.all
    title1 = @blogs[0].title
    content1 = @blogs[0].content
  end

  def new
    @blog=Blog.new
  end
  
  def create
    @blog=Blog.new(blog_params)
    if params[:back]
      render :edit
    else
      if @blog.save
        redirect_to new_blog_path,notice:"ブログを作成しました！"
      else

         #入力フォームを歳描画します。
         render :new 
      end
    end
  end

  def show
  
    
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
     if 
      params[:back]
      render :edit
      else
      @blog.update(blog_params)
      redirect_to blogs_path, notice:"ブログを編集しました!"
    end
  end

  def destroy
   
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  def confirm
    @blog=Blog.new(blog_params)
    @blog.id =params[:id]
    render :new if @blog.invalid?
  end

   private

   def blog_params
    params.require(:blog).permit(:id,:title, :content)
   end
 
    def set_blog
      @blog=Blog.find(params[:id])
    end

    

end
