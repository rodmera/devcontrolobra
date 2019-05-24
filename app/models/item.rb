class Item < ApplicationRecord
	has_many :metrics
	belongs_to :project
	accepts_nested_attributes_for :metrics
	accepts_nested_attributes_for :project
end
