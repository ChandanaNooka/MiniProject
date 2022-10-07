class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :menu_item
	belongs_to :menu_category
	belongs_to :cart

	def total_price
		self.quantity  ||= 1.0  
		self.quantity * self.menu_item.price
	end
end
