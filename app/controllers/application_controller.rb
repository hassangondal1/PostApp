class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        if session[:user_id]
            Current.user=User.find_by(id: session[:user_id])
        end
    end

    def user_must_be_logged_in
        if Current.user == nil
            redirect_to sign_in_path , alert: "User Must Be Logged In"
        end
    end
end
