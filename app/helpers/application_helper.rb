module ApplicationHelper
  def gravatar_for(user, size: 40)
    hash = Digest::MD5.hexdigest(user.email_address.to_s.downcase.strip)
    url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}&d=identicon"
    image_tag url, alt: user.email_address, class: "rounded-full"
  end
end
