module UserMailerHelper

  BLUE = '#29256a'
  GRAY = '#a0a1b5'
  GREEN = '#0f0'

  STYLES = {
      'p' => "color: #{BLUE}; font-size: 90%; margin: 1em 0;",
      'a' => "color: #{GREEN}; text-decoration: none;",
      'h2' => "color: #{BLUE}; font-size: 150%;"
  }

  def ph(tag, content)
    content_tag(tag, content, :style => STYLES[tag.to_s])
  end


  def ppara(&block)
    content_tag(:p, :style => STYLES['p'], &block)
  end

  def plink(name, url)
    link_to(name, url, :style => STYLES['a'])
  end
end