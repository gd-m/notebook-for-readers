class NotesController < ApplicationController
	def index
		@notes = Note.all
	end

	def new
		@note = Note.new
	end

	def create
		@note = Note.create(notes_params)

		redirect_to note_path(@note)
	end

	def show
		@note = Note.find(notes_params)
	end

	def edit
		@note = Note.find(params[:id])
	end

	def update
		@note = Note.find(params[:id])

		@note.update(notes_params)

		redirect_to note_path(@note)
	end

	def destroy
		@note = Note.find(params[:id])
		@note.destroy

		redirect_to notes_path
	end

	private

	def notes_params
		params.require(:note).permit(:content, :public)
	end
end
