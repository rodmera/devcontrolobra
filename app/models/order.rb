class Order < ApplicationRecord
	  validates :PSolicita, :presence => false
    validates :amount, :inclusion => { :in => 1..500000000, :message => "El monto de la OC debe ser mayor a 0" }
	  has_many :products, :dependent => :destroy
    has_one :supplier
    accepts_nested_attributes_for :supplier
	  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true

def self.to_csv
  attributes = %w{id PSolicita Num_Solicitud Estado Fecha_Creacion Fecha_OC Centro_Costo}

  CSV.generate(headers: true) do |csv|
    csv << attributes

    all.each do |order|
      csv << attributes.map{ |attr| order.send(attr) }
    end
  end
end
end
