module TestsHelper

  TEST_LEVELS = { 0 => :elementary, 1 => :easy, 2 => :advanced }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hard
  end
end
