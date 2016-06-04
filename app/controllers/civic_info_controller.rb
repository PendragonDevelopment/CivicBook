class CivicInfoController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def get_representatives
    @address = params[:address]
    @ci = CivicInfo::Base.new(@address)
    @district = @ci.commission_district

    redirect_to representatives_results_path(district: @district)
  end

  def representatives_results
    if params[:district] == "0"
      @msg = "We couldn't find your representative. Try an address within a block of where you are."
    else
      @commissioner = RepresentativeProfile.find_by(district: params[:district])
    end
  end

end