class NotesController < ApplicationController
	def index
		@notes = Note.all
	end

	def new
		@note = Note.new
	end

	def create
		
	end

	def show
		
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private

	def notes_params
		params.require(:note).permit(:content, :public)
	end
end
