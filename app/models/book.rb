class Book < ApplicationRecord
	validates :book, presence: true
end
