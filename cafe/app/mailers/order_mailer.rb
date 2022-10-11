class OrderMailer < ApplicationMailer

	def order_mail(order)
		@order = order
		mail(to: order.user.email, subject: "Your order has been placed and your OrderId: #{order.id}:)" )
	end
end
