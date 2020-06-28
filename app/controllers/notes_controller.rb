class NotesController < ApplicationController

    def create
        @note = Note.new(note_params)
        @note.user = current_user

        if @note.save
            redirect_to track_url(@note.track)
        else
            flash[:errors] = @note.errors.full_messages
            redirect_to track_url(@note.track)
        end
    end

    def destroy
    end

    private
    def note_params
        params.require(:note).permit(:track_id, :content)
    end
end
