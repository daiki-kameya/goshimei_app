class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if  @post.present?
            @post.save
            flash[:success] = "ボシュウ開始されました！"
            redirect_to root_path
          else
            flash[:danger] = "投稿に失敗しました"
            redirect_to root_path
        end
    end

    def index
        @posts = Post.includes(:company).order('created_at DESC')
    end

    def show
        @post = Post.find_by(id: params[:id])
    end



    private
    def post_params
        params.require(:post).permit(:contents,:title)    
    end
end