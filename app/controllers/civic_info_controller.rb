class CivicInfoController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def get_representatives
    @address = params[:address]
    @ci = CivicInfo::Base.new(@address)
    @district = @ci.commission_district
    @officials = @ci.officials
    @info_hash = @ci.concise_info

    redirect_to representatives_results_path(district: @district, info_hash: @info_hash, officials: @officials)
  end

  def representatives_results
    @district = params[:district]
    @info_hash = params[:info_hash]
    @officials = params[:officials]
  end

end