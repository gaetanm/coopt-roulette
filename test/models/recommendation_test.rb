require 'test_helper'

class RecommendationTest < ActiveSupport::TestCase
  def setup
    @recommendation = Recommendation.new phone: "", email: "", linkedin_url: ""
  end

  test "first name should be present" do
    @recommendation.first_name = ""
    assert_not @recommendation.valid?
  end

  test "last name should be present" do
    @recommendation.last_name = ""
    assert_not @recommendation.valid?
  end

  test "email xor phone xor linkedin url should be present" do
    @recommendation.first_name = "Foo"
    @recommendation.last_name = "Bar"
    assert_not @recommendation.valid?
  end

  test "email xor phone xor linkedin url is present" do
    @recommendation.email = "foo@tbar.com"
    @recommendation.first_name = "Foo"
    @recommendation.last_name = "Bar"
    assert @recommendation.valid?
  end
end
