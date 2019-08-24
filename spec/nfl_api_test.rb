require "spec_helper"

describe NFLApiTest
  def test_that_it_has_a_version_number
    refute_nil ::NFLApi::VERSION
  end
end
