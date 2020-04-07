class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if  @post.save
            redirect_to posts_path
            flash[:alert] = "ボシュウ開始されました！"
          else
            redirect_to new_post_path
            flash[:alert] = "投稿に失敗しました"
        end
    end

    def index
        @posts = Post.all.order('created_at DESC')
        
    end

    def edit
    end

    def show
        @post = Post.find_by(id: params[:id])
    end



    private
    def post_params
        params.require(:post).permit(:contents,:title).merge(user_id: current_user.id)
    end
end
