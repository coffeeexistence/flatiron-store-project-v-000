class OrdersController < ApplicationController
	before_action :authenticate_user!

	def show
		@order=Cart.find(params[:id])
	end

	def index
		@orders=current_user.orders
	end
end
