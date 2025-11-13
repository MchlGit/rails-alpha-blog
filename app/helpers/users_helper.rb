require "digest"
require "uri"
module UsersHelper
  def gravatar_for(user, options = { size: 80})
    email_address = user.email.downcase

    # Create the SHA256 hash
    hash = Digest::SHA256.hexdigest(email_address)

    # Set default URL and size parameters
    default = "https://www.example.com/default.jpg"
    size = options[:size]
    # Compile the full URL with URI encoding for the parameters
    params = URI.encode_www_form("d" => default, "s" => size)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?#{params}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end
end
