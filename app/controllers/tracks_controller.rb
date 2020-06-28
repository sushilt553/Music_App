class TracksController < ApplicationController

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

    def track_params
        params.require(:track).permit(:album_id, :name, :ord, :bonus, :lyrics)
    end
end
