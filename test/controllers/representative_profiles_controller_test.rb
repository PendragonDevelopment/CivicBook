require 'test_helper'

class RepresentativeProfilesControllerTest < ActionController::TestCase
  setup do
    @representative_profile = representative_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:representative_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create representative_profile" do
    assert_difference('RepresentativeProfile.count') do
      post :create, representative_profile: { bio: @representative_profile.bio, district: @representative_profile.district, name: @representative_profile.name, office: @representative_profile.office, official_email: @representative_profile.official_email, party_affiliation: @representative_profile.party_affiliation, profession: @representative_profile.profession, term: @representative_profile.term, term_start: @representative_profile.term_start }
    end

    assert_redirected_to representative_profile_path(assigns(:representative_profile))
  end

  test "should show representative_profile" do
    get :show, id: @representative_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @representative_profile
    assert_response :success
  end

  test "should update representative_profile" do
    patch :update, id: @representative_profile, representative_profile: { bio: @representative_profile.bio, district: @representative_profile.district, name: @representative_profile.name, office: @representative_profile.office, official_email: @representative_profile.official_email, party_affiliation: @representative_profile.party_affiliation, profession: @representative_profile.profession, term: @representative_profile.term, term_start: @representative_profile.term_start }
    assert_redirected_to representative_profile_path(assigns(:representative_profile))
  end

  test "should destroy representative_profile" do
    assert_difference('RepresentativeProfile.count', -1) do
      delete :destroy, id: @representative_profile
    end

    assert_redirected_to representative_profiles_path
  end
end
