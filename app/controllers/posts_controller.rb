class PostsController < ApplicationController
    before_action :user_must_be_logged_in
    before_action :set_resources , only:[:edit , :update , :destroy]
    before_action :set_all_posts , only:[:show_all]

    def index
        @posts = Current.user.posts
    end

    def new
        @post = Post.new
    end

    def create
        @post= Current.user.posts.new(post_params)
        if @post.save
            redirect_to posts_path , notice: "Post created Sucessfully"
        else
            render :new 
        end
    end
    
    def edit

    end

    def update
        if @post.update(post_params)
            redirect_to posts_path , notice: "Post Updated Sucessfully"
        else
            render :edit
        end
    end

    def destroy
        @post.delete
        redirect_to posts_path , notice: "Post Deleted Sucessfully"    
    end

    def show_all
        
    end
private
    def post_params
        params.require(:post).permit(:user_id , :title , :post_field)
    end

    def set_resources
        @post = Current.user.posts.find(params[:id])
    end
    def set_all_posts
        @post = Post.all
    end
end