json.data do
    json.array! @industries do |industry|
        json.call(
            industry,
            :id,
            :name
        )
    end
end