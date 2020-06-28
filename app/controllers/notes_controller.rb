class NotesController < ApplicationController
    before_action :require_login

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
        @note = current_user.notes.find_by(id: params[:id])
        @note.destroy
        redirect_to track_url(@note.track)
    end

    private
    def note_params
        params.require(:note).permit(:track_id, :content)
    end
end
