json.array!(@shifts) do |shift|
  json.extract! shift, :id, :start, :end, :desk, :user, :specialpay, :graveyardshift
  json.url shift_url(shift, format: :json)
end
