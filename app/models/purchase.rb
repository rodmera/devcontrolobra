class Purchase < ApplicationRecord
  def self.delete_old
  	@old_purchases = Purchase.where('date < ?', 30.days.ago)
  	@old_purchases.delete_all
  end
end
