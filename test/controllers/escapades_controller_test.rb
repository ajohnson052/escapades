require './test/test_helper'

class EscapadesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @user = create :user
    sign_in @user
    @escapade = create :escapade
    @escapade_with_response = create(:escapade, :with_response)
  end

  describe 'index method' do

    it 'should get index' do
      get :index
      assert_response :success
    end

    it 'should assign escapades' do
      get :index
      assert_equal Escapade.all, assigns(:escapades)
    end

  end

  describe 'show method' do

    it 'should get show' do
      get :show, id: @escapade
      assert_response :success
    end

    it 'should not assign responses when there are no responses' do
      get :show, id: @escapade
      assert_equal @escapade.responses, assigns(:responses)
    end

    it 'should assign responses when there is one response' do
      get :show, id: @escapade_with_response
      assert_equal @escapade_with_response.responses, assigns(:responses)
    end

    it 'should assign the full range as optimal when there are no responses' do
      get :show, id: @escapade
      assert_equal [@escapade.start_date, @escapade.end_date], assigns(:optimal_dates).first
    end

    it 'should assign the response range as optimal when there is one response' do
      get :show, id: @escapade_with_response
      response = @escapade_with_response.responses.first
      availability = response.availabilities.first
      assert_equal [availability.start_date, availability.end_date], assigns(:optimal_dates).first
    end

    it 'should assign overlap in availabilities as optimal when there are two overlapping responses' do
      escapade_overlapping = create(:escapade, :overlapping_responses)
      get :show, id:escapade_overlapping
      response = escapade_overlapping.responses.last
      availability = response.availabilities.first
      assert_equal [availability.start_date, availability.end_date], assigns(:optimal_dates).first
    end

    it 'should assign nothing as optimal when there are two distinct responses' do
      escapade_distinct = create(:escapade, :distinct_responses)
      get :show, id:escapade_distinct
      assert_empty assigns(:optimal_dates)
    end

    it 'should assign overlap in availabilities as optimal when there are complex overlapping responses' do
      escapade_complex = create(:escapade, :complex_overlapping_responses)
      get :show, id: escapade_complex
      response = escapade_complex.responses.last
      availability = response.availabilities.first
      assert_equal [availability.start_date, availability.end_date], assigns(:optimal_dates).first
    end

  end

end
