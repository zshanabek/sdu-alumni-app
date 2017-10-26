json.data do
    json.array! @flights do |flight|
      json.partial! 'v1/flights/flight', flight: flight
    end
  end
  