class CivicInfo
  # This object will take a user's address
  # query the Google Civic Information API
  # and return information about the user's
  # various government districts (Congressional District,
  # County Commission District, etc.)

  include HTTParty
  base_uri 'https://www.googleapis.com/civicinfo/v2'

  def initialize(address)
    @address = address
    @api_key = ENV.fetch('GOOGLE_API_KEY')
    set_options
  end

  def get_commission_district
    council_key = get_civic_info["divisions"].keys.select { |k| k.to_s.include? "council_district" }
    council_key.first.to_s.last.to_i
  end

  # Not necessary right now, but may be useful
  def get_divisions
    get_civic_info["division"].map { |d| d[1]["name"] }
  end

  private

  def set_options
    @options = {
      query: {
        address: @address,
        includeOffices: 'true',
        key: @api_key
      }
    }
  end

  def get_civic_info
    # get the info from Google
    self.class.get('/representatives', @options)
  end

end