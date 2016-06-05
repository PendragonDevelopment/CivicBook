class AddRepresentativeProfileReferenceToFeedbacks < ActiveRecord::Migration
  def change
    add_reference :feedbacks, :representative_profile, index: true, foreign_key: true
  end
end
