json.array!(@shifts) do |shift|
  json.extract! shift, :id, :shift_start, :shift_end, :desk_id, :user_id, :specialpay, :graveyardshift
  json.url shift_url(shift, format: :json)
end
