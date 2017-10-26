json.data do
    json.array! @flight do |flight|
      json.partial! 'v1/flight/flight', flight: flight
    end
  end
  