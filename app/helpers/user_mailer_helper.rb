module UserMailerHelper
  FONT = "font-family:'HelveticaNeue',Helvetica,Arial,sans-serif"
  BLUE = '#29256a'
  GRAY = '#a0a1b5'
  GREEN = '#0f0'

  STYLES = {
      'p' => "#{FONT};color: #{BLUE}; font-size: 90%; margin: 1em 0;",
      'a' => "#{FONT};color: #{GREEN}; text-decoration: none;",
      'h2' => "#{FONT};color: #{BLUE}; font-size: 120%;",
      'h1' => "#{FONT};color: #{BLUE}; font-size: 150%;"
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