require "test_helper"

class NFLApiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::NFLApi::VERSION
  end
end
