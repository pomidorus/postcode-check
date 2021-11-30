class PostcodesCheckerService
  ALLOWED_POSTCODES = %w[SH241AA SH241AB].freeze

  def check(postcode)
    code = postcode.split(' ').join('').upcase
    ALLOWED_POSTCODES.include? code
  end
end
