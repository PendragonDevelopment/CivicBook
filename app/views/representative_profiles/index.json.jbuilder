json.array!(@representative_profiles) do |representative_profile|
  json.extract! representative_profile, :id, :name, :office, :district, :term, :term_start, :bio, :profession, :party_affiliation, :official_email
  json.url representative_profile_url(representative_profile, format: :json)
end
