# == Schema Information
#
# Table name: representative_profiles
#
#  id                  :integer          not null, primary key
#  name                :string
#  office              :string
#  district            :string
#  term                :datetime
#  term_start          :datetime
#  bio                 :text
#  profession          :string
#  party_affiliation   :string
#  official_email      :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class RepresentativeProfilesController < ApplicationController
  before_action :set_representative_profile, only: [:show, :edit, :update, :destroy]

  # GET /representative_profiles
  # GET /representative_profiles.json
  def index
    @representative_profiles = RepresentativeProfile.all
  end

  # GET /representative_profiles/1
  # GET /representative_profiles/1.json
  def show
  end

  # GET /representative_profiles/new
  def new
    @representative_profile = RepresentativeProfile.new
  end

  # GET /representative_profiles/1/edit
  def edit
  end

  # POST /representative_profiles
  # POST /representative_profiles.json
  def create
    @representative_profile = RepresentativeProfile.new(representative_profile_params)

    respond_to do |format|
      if @representative_profile.save
        format.html { redirect_to @representative_profile, notice: 'Representative profile was successfully created.' }
        format.json { render :show, status: :created, location: @representative_profile }
      else
        format.html { render :new }
        format.json { render json: @representative_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /representative_profiles/1
  # PATCH/PUT /representative_profiles/1.json
  def update
    respond_to do |format|
      if @representative_profile.update(representative_profile_params)
        format.html { redirect_to @representative_profile, notice: 'Representative profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @representative_profile }
      else
        format.html { render :edit }
        format.json { render json: @representative_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /representative_profiles/1
  # DELETE /representative_profiles/1.json
  def destroy
    @representative_profile.destroy
    respond_to do |format|
      format.html { redirect_to representative_profiles_url, notice: 'Representative profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_representative_profile
      @representative_profile = RepresentativeProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def representative_profile_params
      params.require(:representative_profile).permit(:name, :office, :district, :term, :term_start, :bio, :profession, :party_affiliation, :official_email, :avatar)
    end
end
