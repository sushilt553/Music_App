class TracksController < ApplicationController

    def new
        @album = Album.find_by(id: params[:album_id])
        @track = Track.new(album_id: params[:album_id])
        render :new
    end

    def create
        @track = Track.new(track_params)

        if @track.save
            redirect_to track_url(@track)
        else
            @album = @track.album
            flash.now[:errors] = @track.errors.full_messages
            render :new
        end
    end

    def show
        @track = Track.find_by(id: params[:id])

        if @track
            render :show
        else
            flash[:errors] = ["Track not found"]
            redirect_to root_url
        end
    end

    def edit
        @track = Track.find_by(id: params[:id])
        render :edit
    end

    def update
        @track = Track.find_by(id: params[:id])

        if @track.update_attributes(track_params)
            redirect_to track_url(@track)
        else
            flash.now[:errors] = @track.errors.full_messages
            render :edit
        end
    end

    def destroy
        @track = Track.find_by(id: params[:id])

        if @track
            @track.destroy
            redirect_to album_url(@track.album)
        else
            flash[:errors] = ["Track not found"]
            redirect_to root_url
        end
    end

    private

    def track_params
        params.require(:track).permit(:album_id, :name, :ord, :bonus, :lyrics)
    end
end
