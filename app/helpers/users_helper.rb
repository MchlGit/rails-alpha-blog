require "digest"
require "uri"
module UsersHelper
  def gravatar_for(user, options = { size: 80})
    email_address = user.email.downcase

    # Create the SHA256 hash
    hash = Digest::SHA256.hexdigest(email_address)

    # Set default URL and size parameters
    default = "https://docs.gravatar.com/wp-content/uploads/2025/02/avatar-default-20250210-256.png"
    size = options[:size]
    # Compile the full URL with URI encoding for the parameters
    params = URI.encode_www_form("d" => default, "s" => size.to_i)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?#{params}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block", width: size, height: size)
  end
end
