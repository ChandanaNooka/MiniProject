class MenuItem < ActiveRecord::Base
	belongs_to :menu_category
	belongs_to :order
end
