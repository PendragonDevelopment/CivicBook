module CivicInfo
  class ConciseInfo

    def initialize(civic_info)
      @civic_info = civic_info
    end

    def call
      return { council_district: 0 } if @civic_info.code == 400
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
      test_array = @civic_info["divisions"].keys.map do |k|
        k.split('/')
      end
      test_array.flatten!.uniq!
      test_array[1..test_array.length]
    end
  end
end