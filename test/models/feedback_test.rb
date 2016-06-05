# == Schema Information
#
# Table name: feedbacks
#
#  id          :integer          not null, primary key
#  survey_type :integer
#  survey_url  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string
#

require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
