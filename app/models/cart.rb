class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, through: :line_items

	def total
		self.line_items.inject(0){|sum, line_item| sum+(line_item.quantity*line_item.item.price) }
	end

	def add_item(item_id)
		pre_existing_line=line_for_item?(item_id)
		if pre_existing_line
			pre_existing_line.quantity+=1
			pre_existing_line
		else
			LineItem.new(cart: self, item_id: item_id)
		end

	end

	def line_for_item?(item_id)
		result=self.line_items.where(item_id: item_id)
		result.length>0 ? result[0] : false
	end
end
