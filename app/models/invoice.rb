class Invoice < ApplicationRecord
	has_many :items
	belongs_to :order
	accepts_nested_attributes_for :items

	def self.all_with_order_details
		
		Invoice.select("invoices.*, orders.id as ID_OC, orders.PSolicita as Solicitante, orders.estado as estado, orders.Centro_Costo as CCosto, orders.subtotal1 as valorneto, orders.amount as valortotal, orders.despacho as observaciones").joins(:order)
	end
end
