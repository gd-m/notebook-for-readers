class Book < ApplicationRecord
	has_many :notes
	validates :name, presence: true

	accepts_nested_attributes_for :notes
end
