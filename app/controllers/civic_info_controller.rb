class CivicInfoController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def get_representatives
    @address = params[:address]
    @ci = CivicInfo.new(@address)
    @district = @ci.commission_district
    @info_hash = @ci.info_hash

    redirect_to representatives_results_path(district: @district, info_hash: @info_hash)
  end

  def representatives_results
    @district = params[:district]
    @info_hash = params[:info_hash]
  end

end