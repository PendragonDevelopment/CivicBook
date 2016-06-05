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

class Feedback < ActiveRecord::Base

  enum survey_type: [:typeform, :google_form]
end
