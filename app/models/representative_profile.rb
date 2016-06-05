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
#  phone_number        :string
#

class RepresentativeProfile < ActiveRecord::Base
  has_many :feedbacks, dependent: :destroy

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }, :default_url => ":style/missing.png"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
