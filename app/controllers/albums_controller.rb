class AlbumsController < ApplicationController

    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def album_params
        params.require(:album).permit(:title, :year, :live, :band_id, :name)
    end
end
