class NotesController < ApplicationController
	def index
		@notes = Note.all
	end

	def new
		if params[:book_id] && book = Book.find_by_id(params[:book_id])
			@note = book.notes.build			
		else
			@note = Note.new
			@note.build_book
		end
	end

	def create
		@note = current_user.notes.build(note_params)
		if @note.save
			redirect_to note_path(@note)
		else
			@note.build_book unless @note.book
			render :new
		end
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
