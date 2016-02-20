class LineItemsController < ApplicationController
	before_action :authenticate_user!
	def create
		require 'pry'

		#binding.pry
		@user=current_user

		unless @user.current_cart
			new_cart=@user.carts.create
			@user.current_cart=new_cart
			@user.save
		end

		existing_line_item=already_has_item?
		if existing_line_item
			existing_line_item.quantity+=1
			existing_line_item.save
		else	
			@user.current_cart.line_items.create(item_id:params[:item_id])
		end

		#@user.current_cart.line_items.create(item_id:params[:item_id])
		redirect_to cart_path(@user.current_cart)

	end

	private

	def already_has_item?
		@user.current_cart.line_items.where(item_id: params[:item_id])[0]
	end


end
