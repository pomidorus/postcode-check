class LsoaCheckerService
  ALLOWED_LSOA = %w[Southwark Lambeth].freeze

  def check(lsoa)
    region = lsoa.split(' ')[0]
    ALLOWED_LSOA.include? region
  end
end
