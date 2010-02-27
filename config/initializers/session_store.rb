# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_dapper_session',
  :secret => '43b6f4504627bf88cbef379a6f27acb5b4aed4949cfd043651664e3d57bce4a7d33dc246624e9f8d0a6562dc6352f78031fc87c94a8306fd70e95b6cdeae643c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
