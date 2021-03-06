module UsersHelper
  def user_action(user, time)
    avatar_img(user) + link_to(user.name, user) + ' hace ' + time_ago_in_words(time)
  end


  def avatar_url(user, size = 40)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=retro"
  end

  def avatar_img(user, size = 16)
    image_tag(avatar_url(user, size), :class => 'avatar', :width => size, :height => size)
  end
end
