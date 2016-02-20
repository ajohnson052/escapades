require './test/test_helper'

class EscapadesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @user = create :user
    sign_in @user
    @escapade = create :escapade
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
      @escapade_with_response = create(:escapade, :with_response)
      get :show, id: @escapade_with_response
      assert_equal @escapade.responses, assigns(:responses)
    end

  end

end
