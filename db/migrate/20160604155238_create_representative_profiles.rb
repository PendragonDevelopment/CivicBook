class CreateRepresentativeProfiles < ActiveRecord::Migration
  def change
    create_table :representative_profiles do |t|
      t.string :name
      t.string :office
      t.string :district
      t.datetime :term
      t.datetime :term_start
      t.text :bio
      t.string :profession
      t.string :party_affiliation
      t.string :official_email

      t.timestamps null: false
    end
  end
end
