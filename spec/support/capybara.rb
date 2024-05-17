require 'capybara/rspec'

Capybara.server = :puma, { Silent: true } # Faster server, quiet output
Capybara.javascript_driver = :selenium_chrome_headless
