class UserController < ApplicationController

    def index

    end

    def auth
        email = params[:email]
        password = params[:password]

        user = User.find_by(email: email)
        if user
            if user.authenticate(password)

                # Buat Sesi
                session[:user_id] = user.id
                redirect_to crud_index_path, notice: "Selamat datang #{user.name}", alert: "success"
            else
                redirect_to user_index_path, notice: "Password tidak sesuai", alert: "danger"
            end
        else
            redirect_to user_index_path, notice: "Email tidak sesuai", alert: "danger"
        end
    end

    def register
        @user = User.new
    end

    def kirim
        @kirim = User.new(user_params)

        if @kirim.save
            redirect_to user_index_path, notice: 'Berhasil Registrasi', alert: "success"
        else
            render :register
        end

    end

    def logout
        session[:user_id] = nil
        redirect_to user_index_path, notice: "Anda telah logout", alert: "success"
    end

    private
    def user_params
        params.require(:user).permit(:name,:email,:password)
    end
    
end
