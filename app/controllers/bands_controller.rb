class BandsController < ApplicationController

    def index
        @bands = Band.all
        render :index
    end

    def show
        @band = Band.find_by(id: params[:id])

        if @band
            redirect_to band_url(@band)
        else
            flash[:errors] = ["Band not found"]
            redirect_to bands_url
        end
    end

    def new
        render :new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
