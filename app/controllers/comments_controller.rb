class CommentsController < ApplicationController
before_action :user_must_be_logged_in
before_action :set_all_comments , only:[:show_all]
def new
    @comment = Comment.new
end


def create
    
    @comment= Current.user.post.comments.new(comment_params)
    if @comment.save
        redirect_to comments_path , notice: "Comment created Sucessfully"
    else
        flash[:alert] = "Something went Wrong"
        render :new 
    end
end

private

def comment_params

    params.require(:comment).permit(:user_id ,  :post_id , :comment_field)

end

def show_all

end

def set_all_posts
    @comment = Comment.all
end


end