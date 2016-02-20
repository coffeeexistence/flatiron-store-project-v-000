class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :recoverable, :lockable, :validatable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'

  def orders
  	self.carts.where("status='submitted'")
  end
end
