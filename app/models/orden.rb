class Orden < ApplicationRecord
	has_many :products
	accepts_nested_attributes_for :products, :allow_destroy => true
	validates :PSolicita, :presence => true
	
def self.to_csv
  attributes = %w{id PSolicita Num_Solicitud Estado Fecha_Creacion Fecha_OC Centro_Costo}

  CSV.generate(headers: true) do |csv|
    csv << attributes

    all.each do |orden|
      csv << attributes.map{ |attr| orden.send(attr) }
    end
  end
end
end
