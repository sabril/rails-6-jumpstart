module ApplicationHelper
  def avatar_url(user)
    return "https://www.gravatar.com/avatar/#{Digest::MD5::hexdigest(user.email).downcase}.jpg?id=identicon&s=50"
  end

  def truncated_username(name)
    name.titleize.truncate(20, separator: /\s/, omission: ' ...')
  end

  def username(user)
    strip_tags(user.name).gsub('.', ' ').titleize
  end
end
