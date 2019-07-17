class Note < ApplicationRecord
	belongs_to :user
	belongs_to :book

	validates :content, presence: true , length: {in: 1..200}
	#validates :public, presence: true
	validates_associated :book
	accepts_nested_attributes_for :book

	scope :public_notes, -> {where(public: true)}
end
