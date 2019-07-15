class Book < ApplicationRecord
	has_many :notes
	validates :book, presence: true
end
