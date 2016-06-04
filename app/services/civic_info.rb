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
    @options = set_options
  end

  def commission_district
    # Get the County Commission district that the address
    # belongs to.
    info_hash[:council_district].to_i
  end

  def info_hash
    # Returns general information about the address
    # 
    # Sample Response
    # ===============
    # => 
    # {
    #  :country=>"us",
    #  :state=>"ga",
    #  :county=>"clarke",
    #  :sldu=>"46",
    #  :place=>"athens",
    #  :council_district=>"4",
    #  :sldl=>"117",
    #  :cd=>"10"
    # }
    #
    extract_division_hash
  end

  private

  def set_options
    {
      query: {
        address: @address,
        includeOffices: 'false',
        key: @api_key
      }
    }
  end

  def get_civic_info
    # Get the civic info from Google
    #
    # Sample Response
    # ===============
    # 
    # {
    #   "kind": "civicinfo#representativeInfoResponse",
    #   "normalizedInput": {
    #     "line1": "6105 rushing parc ln",
    #     "city": "birmingham",
    #     "state": "AL",
    #     "zip": "35244"
    #   },
    #   "divisions": {
    #     "ocd-division/country:us/state:al/county:shelby/council_district:5": {
    #       "name": "Shelby County Commission District 5"
    #     },
    #     "ocd-division/country:us/state:al/cd:6": {
    #       "name": "Alabama's 6th congressional district"
    #     },
    #     "ocd-division/country:us/state:al/place:hoover": {
    #       "name": "Hoover city"
    #     },
    #     "ocd-division/country:us": {
    #       "name": "United States"
    #     },
    #     "ocd-division/country:us/state:al/sldu:14": {
    #       "name": "Alabama State Senate district 14"
    #     },
    #     "ocd-division/country:us/state:al/county:shelby": {
    #       "name": "Shelby County"
    #     },
    #     "ocd-division/country:us/state:al/sldl:15": {
    #       "name": "Alabama State House district 15"
    #     },
    #     "ocd-division/country:us/state:al": {
    #       "name": "Alabama"
    #     }
    #   }
    # }
    self.class.get('/representatives', @options)
  end

  # The next two methods take the keys from the ["divisions"] object
  # in the API response, split them into their component parts
  # and convert them into a hash of useful information
  def extract_division_hash
    new_hash = {}
    make_division_array.each do |k|
      array = k.split(':')
      new_hash[array.first] = array.last
    end
    new_hash.symbolize_keys
  end

  def make_division_array
    test_array = get_civic_info["divisions"].keys.map do |k|
      k.split('/')
    end
    test_array.flatten!.uniq!
    test_array[1..test_array.length]
  end
end
