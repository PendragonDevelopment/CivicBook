class CivicInfo
  # This object will take a user's address
  # query the Google Civic Information API
  # and return information about the user's
  # various government districts (Congressional District,
  # County Commission District, etc.)

  def initialize(address)
    @address = address
    @api_key = "AIzaSyCBry-wWNlRyWlE-i9a4Oj8Kbxyvd7wW8o"
  end

  def get_civic_info
    # get the info from Google
    {
      "kind": "civicinfo#representativeInfoResponse",
      "normalizedInput": {
        "line1": "6105 rushing parc ln",
        "city": "birmingham",
        "state": "AL",
        "zip": "35244"
      },
      "divisions": {
        "ocd-division/country:us/state:al/county:shelby/council_district:5": {
          "name": "Shelby County Commission District 5"
        },
        "ocd-division/country:us/state:al/cd:6": {
          "name": "Alabama's 6th congressional district"
        },
        "ocd-division/country:us/state:al/place:hoover": {
          "name": "Hoover city"
        },
        "ocd-division/country:us": {
          "name": "United States"
        },
        "ocd-division/country:us/state:al/sldu:14": {
          "name": "Alabama State Senate district 14"
        },
        "ocd-division/country:us/state:al/county:shelby": {
          "name": "Shelby County"
        },
        "ocd-division/country:us/state:al/sldl:15": {
          "name": "Alabama State House district 15"
        },
        "ocd-division/country:us/state:al": {
          "name": "Alabama"
        }
      }
    }
  end

  def get_commission_district
    council_key = get_civic_info[:divisions].keys.select { |k| k.to_s.include? "council_district" }
    council_key.first.to_s.last.to_i
  end

  # Not necessary right now, but may be useful
  def get_divisions
    get_civic_info[:divisions].map { |d| d[1][:name] }
  end

end