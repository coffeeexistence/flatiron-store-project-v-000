class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :recoverable, :lockable, :validatable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  has_many :carts

  attr_accessor :current_cart

end
