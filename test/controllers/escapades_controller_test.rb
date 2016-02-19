require 'test_helper'

class EscapadesControllerTest < ActionController::TestCase

  def setup
    @escapade = create :escapade
  end

  describe 'show method' do

    it 'should direct to the proper show path' do
      get :show, escapade: @escapade
      assert_redirected_to escapade_path(@escapade)
    end

  end

end
