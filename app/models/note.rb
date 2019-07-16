class Note < ApplicationRecord
	belongs_to :user
	belongs_to :book

	validates :content, presence: true , length: {in: 1..200}
	#validates :public, presence: true

	accepts_nested_attributes_for :book
end
