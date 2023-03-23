json.extract! reservation, :id, :checkin_date, :checkout_date, :count_people, :user_id, :room_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
