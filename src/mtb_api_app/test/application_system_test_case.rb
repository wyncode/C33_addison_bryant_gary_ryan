require 'capybara/poltergeist'
require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
    driven_by driver :poltergeist
end