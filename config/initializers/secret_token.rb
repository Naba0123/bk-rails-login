# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Login::Application.config.secret_key_base = 'c0acfdcdaea9c13e7c2af02091d32a8136362fda9a9d875bb6110c2ffe99b60b1b96fc1a8284e17bdbff0b7c65f5774f2ac2245b8221473f6b9289ecf832d773'
