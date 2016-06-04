class AddAttachmentAvatarToRepresentativeProfiles < ActiveRecord::Migration
  def self.up
    change_table :representative_profiles do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :representative_profiles, :avatar
  end
end
