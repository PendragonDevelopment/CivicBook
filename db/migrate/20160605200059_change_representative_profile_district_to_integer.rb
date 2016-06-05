class ChangeRepresentativeProfileDistrictToInteger < ActiveRecord::Migration
  def change
    add_column :representative_profiles, :district_id, :integer
  end
end
