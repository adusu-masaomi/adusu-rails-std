require 'test_helper'

class WorkingTimesControllerTest < ActionController::TestCase
  setup do
    @working_time = working_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:working_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create working_time" do
    assert_difference('WorkingTime.count') do
      post :create, working_time: { break_time_1_end_time: @working_time.break_time_1_end_time, break_time_1_start_time: @working_time.break_time_1_start_time, break_time_2_end_time: @working_time.break_time_2_end_time, break_time_2_start_time: @working_time.break_time_2_start_time, break_time_3_end_time: @working_time.break_time_3_end_time, break_time_3_start_time: @working_time.break_time_3_start_time, employment_status_id: @working_time.employment_status_id, overtime_early_end_time: @working_time.overtime_early_end_time, overtime_early_start_time: @working_time.overtime_early_start_time, overtime_end_time: @working_time.overtime_end_time, overtime_midnight_end_time: @working_time.overtime_midnight_end_time, overtime_midnight_start_time: @working_time.overtime_midnight_start_time, overtime_start_time: @working_time.overtime_start_time, working_time_end_time: @working_time.working_time_end_time, working_time_start_time: @working_time.working_time_start_time }
    end

    assert_redirected_to working_time_path(assigns(:working_time))
  end

  test "should show working_time" do
    get :show, id: @working_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @working_time
    assert_response :success
  end

  test "should update working_time" do
    patch :update, id: @working_time, working_time: { break_time_1_end_time: @working_time.break_time_1_end_time, break_time_1_start_time: @working_time.break_time_1_start_time, break_time_2_end_time: @working_time.break_time_2_end_time, break_time_2_start_time: @working_time.break_time_2_start_time, break_time_3_end_time: @working_time.break_time_3_end_time, break_time_3_start_time: @working_time.break_time_3_start_time, employment_status_id: @working_time.employment_status_id, overtime_early_end_time: @working_time.overtime_early_end_time, overtime_early_start_time: @working_time.overtime_early_start_time, overtime_end_time: @working_time.overtime_end_time, overtime_midnight_end_time: @working_time.overtime_midnight_end_time, overtime_midnight_start_time: @working_time.overtime_midnight_start_time, overtime_start_time: @working_time.overtime_start_time, working_time_end_time: @working_time.working_time_end_time, working_time_start_time: @working_time.working_time_start_time }
    assert_redirected_to working_time_path(assigns(:working_time))
  end

  test "should destroy working_time" do
    assert_difference('WorkingTime.count', -1) do
      delete :destroy, id: @working_time
    end

    assert_redirected_to working_times_path
  end
end
