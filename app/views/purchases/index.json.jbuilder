
json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :amount, :company, :contragent, :currency, :date
  json.url purchase_url(purchase, format: :json)
end