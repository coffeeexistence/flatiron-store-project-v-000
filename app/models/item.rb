class Item < ActiveRecord::Base
	belongs_to :category
	has_many :line_items

	def self.available_items
		self.all.find_all{ |item| item.inventory>0 }
	end
end
