require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @result = results(:one)
  end

  test "should get index" do
    get results_url
    assert_response :success
  end

  test "should get new" do
    get new_result_url
    assert_response :success
  end

  test "should create result" do
    assert_difference('Result.count') do
      post results_url, params: { result: { centre_no: @result.centre_no, emis: @result.emis, name: @result.name, passed_2014: @result.passed_2014, passed_2015: @result.passed_2015, passed_2016: @result.passed_2016, wrote_2014: @result.wrote_2014, wrote_2015: @result.wrote_2015, wrote_2016: @result.wrote_2016 } }
    end

    assert_redirected_to result_url(Result.last)
  end

  test "should show result" do
    get result_url(@result)
    assert_response :success
  end

  test "should get edit" do
    get edit_result_url(@result)
    assert_response :success
  end

  test "should update result" do
    patch result_url(@result), params: { result: { centre_no: @result.centre_no, emis: @result.emis, name: @result.name, passed_2014: @result.passed_2014, passed_2015: @result.passed_2015, passed_2016: @result.passed_2016, wrote_2014: @result.wrote_2014, wrote_2015: @result.wrote_2015, wrote_2016: @result.wrote_2016 } }
    assert_redirected_to result_url(@result)
  end

  test "should destroy result" do
    assert_difference('Result.count', -1) do
      delete result_url(@result)
    end

    assert_redirected_to results_url
  end
end
