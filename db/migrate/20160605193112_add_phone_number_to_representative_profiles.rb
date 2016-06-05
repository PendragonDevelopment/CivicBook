class AddPhoneNumberToRepresentativeProfiles < ActiveRecord::Migration
  def change
    add_column :representative_profiles, :phone_number, :string
  end
end
