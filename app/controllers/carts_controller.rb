class CartsController < ApplicationController
	before_action :authenticate_user!

	def show
		require 'pry'
		#binding.pry
	end

	def checkout
		cart=current_cart
		cart.line_items.each do |line_item|
			#lower inventory
			line_item.item.inventory-=line_item.quantity
			line_item.item.save
		end
		cart.status='submitted'
		current_user.current_cart=nil
		current_user.save
		cart.save
		redirect_to cart_path(cart)
	end
end
