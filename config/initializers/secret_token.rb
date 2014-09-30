# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Gcs::Application.config.secret_key_base = 'b4da51c4319cfa5c235b9c8dda08686570ab3b54a78dd3b7eb2f71c9d22606ad01d6e2b0b0b76769c3c7966320947b1f2a74d15965afee9c7e545f999e020681'
