class Postcode
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def lsoa
    data['lsoa']
  end
end
