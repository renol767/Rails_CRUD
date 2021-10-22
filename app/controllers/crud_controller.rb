class CrudController < ApplicationController

    before_action :user_signed_in?
    helper_method :current_user

    # CONTROLLER INDEX
    def index
        @datas = Crud.all
    end

    # Tambah Data
    def add
        @add = Crud.new
    end

    # Kirim Data
    def kirim
        @kirim = Crud.new(crud_params)

        if @kirim.save
            redirect_to crud_index_path, notice: 'Input Data Berhasil', alert: "success"
        else
            render :add
        end

    end

    # Edit Data Fetch 1 Data
    def edit
        @get_id = Crud.find(params[:id])
    end

    # untuk mengupdate data dari action edit
    def update
        @get_id = Crud.find(params[:id])

        if @get_id.update(crud_params)
            redirect_to crud_index_path, notice: 'Update Data Berhasil', alert: "success"
        else
            render :edit
        end
    end

    # untuk hapus data
    def delete
        @get_id = Crud.find(params[:id])

        if @get_id.destroy
            redirect_to crud_index_path, notice: 'Delete Data Berhasil', alert: "success"
        else
            render :index
        end
    end

    private
    def crud_params
        params.require(:crud).permit(:name, :email, :address, :status)
    end
end
