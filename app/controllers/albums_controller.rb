class AlbumsController < ApplicationController

    def show
        @album = Album.find_by(id: params[:id])
        render :show
    end

    def new
        @band = Band.find_by(id: params[:band_id])
        @album = Album.new(band_id: @band.id)
        render :new
    end

    def create
        @album = Album.new(album_params)

        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end
    end

    def edit
        @album = Album.find_by(id: params[:id])
        render :edit
    end

    def update
        @album = Album.find_by(id: params[:id])

        if @album.update_attributes(album_params)
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :edit
        end
    end

    def destroy
        @album = Album.find_by(id: params[:id])

        if @album
            @album.destroy
            redirect_to band_url(@album.band)
        else
            flash[:errors] = ["Cannot be deleted"]
            redirect_to band_url(@album.band)
        end
    end

    private
    def album_params
        params.require(:album).permit(:year, :live, :band_id, :name)
    end
end
