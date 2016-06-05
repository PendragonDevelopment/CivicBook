# == Schema Information
#
# Table name: feedbacks
#
#  id                        :integer          not null, primary key
#  survey_type               :integer
#  survey_url                :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  title                     :string
#  representative_profile_id :integer
#

class FeedbacksController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.all
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @representative_profile = RepresentativeProfile.find(params[:feedback][:representative_profile_id])
    @feedback = @representative_profile.feedbacks.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
      @representative_profile = @feedback.representative_profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:title, :survey_type, :survey_url, :representative_profile_id)
    end
end
