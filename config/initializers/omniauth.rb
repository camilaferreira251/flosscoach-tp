Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV["FACEBOOK_KEY"], ENV["FACEBOOK_TOKEN"], 
    :scope => "email, public_profile"

    provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_TOKEN"]

    provider :github, ENV["GITHUB_KEY"], ENV["GITHUB_TOKEN"]


end