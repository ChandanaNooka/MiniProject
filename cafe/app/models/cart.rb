class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :menu_items, through: :order_items
	has_many :order_items, dependent: :destroy


	def sub_total
		sum = 0
		self.order_items.each do |item|
			sum += item.total_price
		end
		return sum
	end
end

# def add_menu_item(menu_item_id)
# 	menu_item = MenuItem.find(menu_item_id)
# 	Cart.menu_item << MenuItem.new(menu_item_id: menu_item_id, quantity: 1)
# 	save
# end

# def add_item(menu_item_id)
# 		menu_item = menu_items.where('menu_item_id = ?', menu_item_id).first
# 		if menu_item
# 			menu_item.quantity + 1
# 			save
# 		else
# 			cart.menu_items << MenuItem.new(menu_item_id: menu_item_id, quantity: 1)
# 		end
# 		save
# end

# def add_menu_item(menu_item_id)
# 		menu_item = MenuItem.find(menu_item_id)
# 		if menu_item
# 			self.menu_items << menu_item
# 		end
# 		save
# end

