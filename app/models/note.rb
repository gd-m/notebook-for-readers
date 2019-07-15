class Note < ApplicationRecord
	validates :content, presence: true , length: {in: 1..200}
	validates :public, presence: true
end
