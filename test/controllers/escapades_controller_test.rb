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

    it 'should not return optimal dates if there are no responses' do
      get :show, id: @escapade
      assert_equal @escapade.responses, assigns(:responses)
    end

    # it 'should return response availability if there is one response' do
    #   @test_response = @escapade.responses.create(:response)
    #   puts @test_response.user.email
    #   @test_response.availabilities.create(attributes_for(:availability))
    #   # get :show, id: @escapade
    #   assert_equal @escapade.responses, assigns(:responses)
    # end

  end

end
