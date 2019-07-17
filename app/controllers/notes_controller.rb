class NotesController < ApplicationController
	def index
		if params[:book_id] && book = Book.find_by_id(params[:book_id])
			@notes = book.notes.public_notes
		else
			@notes = current_user.notes
		end
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
		@note = current_user.notes.build(notes_params)
		if @note.save
			redirect_to note_path(@note)
		else
			@note.build_book unless @note.book
			render :new
		end
	end

	def show
		set_note
		@book = Book.find_by_id(@note.book_id)
	end

	def edit
		set_note
	end

	def update
		set_note

		@note.update(notes_params)

		redirect_to note_path(@note)
	end

	def destroy
	set_note
		@note.destroy

		redirect_to notes_path
	end

	private

	def set_note
		@note = Note.find_by_id(params[:id])
		if !@note
			redirect_to notes_path
		end
	end

	def notes_params
		params.require(:note).permit(:content, :public, :book_id, book_attributes: [:name])
	end
end
