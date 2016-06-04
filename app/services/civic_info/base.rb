module CivicInfo
  class Base

    API_KEY = ENV.fetch('GOOGLE_API_KEY')

    def initialize(address)
      @address = address
      @civic_info = CivicInfo::GetCivicInfo.call(@address)
    end

    def commission_district
      concise_info[:council_district].to_i
    end

    def concise_info
      CivicInfo::ConciseInfo.new(@civic_info).call
    end

    def full_info
      @civic_info
    end

    def officials
      # This needs work
      CivicInfo::GetOfficials.new(@civic_info).call
    end

  end
end