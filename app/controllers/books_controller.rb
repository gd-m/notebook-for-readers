class BooksController < ApplicationController
	def new
		@book = Book.new	
	end

	def show
		@book = Book.find(params[:id])
	end

	def create
		@book = Book.create(book_params)

		redirect_to book_path(@book)

	end

	def index
		
	end
	
	def edit
		
	end

	def update
		
	end

	def destroy
	end

	private

	def book_params
		params.require(:book).permit(:name)
	end
end
