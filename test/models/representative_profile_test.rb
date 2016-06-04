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

require 'test_helper'

class RepresentativeProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
