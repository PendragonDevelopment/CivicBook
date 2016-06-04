module CivicInfo
  class GetOfficials

    def initialize(civic_info)
      @civic_info = civic_info
    end

    def call
      official_hash = {}
      (count-5).times do |i|

        i=i*-1
        official_hash[offices[i]['name']] = officials[i]['name']
      end
      official_hash
    end

    def count
      @civic_info['offices'].count
    end


    def offices
      @civic_info['offices']
    end

    def officials
      @civic_info['officials']
    end


  end
end