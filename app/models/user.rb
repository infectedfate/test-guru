class User < ApplicationRecord
end

def passed_tests(level)
  tests.by_level(level)
end
