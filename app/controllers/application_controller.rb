class ApplicationController < ActionController::Base

    # Mencari User Berdasarkan Session Key
    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        else
            nil
        end
    end

    def user_signed_in?
        if current_user
            true
        else
            redirect_to user_index_path, notice: "Silahkan login terlebih dahulu!", alert: "danger"
            return false
        end
        
    end
end
