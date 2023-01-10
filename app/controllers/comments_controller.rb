class CommentsController < ApplicationController
before_action :user_must_be_logged_in
before_action :set_all_comments , only:[:show]

    def new
        @comment = Comment.new
    end


    def create
        
        @comment= Current.user.comments.new(comment_params)
        if @comment.save
            redirect_to all_users_posts_path , notice: "Comment created Sucessfully"
        else
            flash[:alert] = "Something went Wrong"
            render :new 
        end
    end

    private

    def comment_params
        params[:comment][:user_id] = Current.user.id 
        params[:comment][:post_id] = params[:id]

        params.require(:comment).permit(:user_id ,  :post_id , :comment_field)

    end

    def show

    end

    def set_all_comments
        @comment = User.comments.all
    end

    def set_resources

    end
end