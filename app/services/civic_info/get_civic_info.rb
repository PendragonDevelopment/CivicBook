module CivicInfo
  class GetCivicInfo
    # This object will take a user's address
    # query the Google Civic Information API
    # and return information about the user's
    # various government districts (Congressional District,
    # County Commission District, etc.)

    include HTTParty
    base_uri 'https://www.googleapis.com/civicinfo/v2'

    def self.call(address)
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

      options = {
        query: {
          address: address,
          includeOffices: 'true',
          key: CivicInfo::Base::API_KEY
        }
      }

      self.get('/representatives', options)
    end

  end
end