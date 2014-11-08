require 'test_helper'

class TutorProfilesControllerTest < ActionController::TestCase
  setup do
    @tutor_profile = tutor_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tutor_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tutor_profile" do
    assert_difference('TutorProfile.count') do
      post :create, tutor_profile: { format: @tutor_profile.format }
    end

    assert_redirected_to tutor_profile_path(assigns(:tutor_profile))
  end

  test "should show tutor_profile" do
    get :show, id: @tutor_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tutor_profile
    assert_response :success
  end

  test "should update tutor_profile" do
    patch :update, id: @tutor_profile, tutor_profile: { format: @tutor_profile.format }
    assert_redirected_to tutor_profile_path(assigns(:tutor_profile))
  end

  test "should destroy tutor_profile" do
    assert_difference('TutorProfile.count', -1) do
      delete :destroy, id: @tutor_profile
    end

    assert_redirected_to tutor_profiles_path
  end
end
