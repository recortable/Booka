module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

      when /^the home\s?page$/
        '/'

      when /^"([^"]*)" contents page$/
        project = Project.find_by_title($1)
        project_contents_path(project)

      # BookaLine
      when /^booka lines page$/
        booka_lines_path

      when /^"([^"]*)" booka line page$/
        booka_line = BookaLine.find_by_title!($1)
        booka_line_path(booka_line)

      # Content
      when /^"([^"]*)" new content page$/
        project = Project.find_by_title!($1)
        new_project_content_path(project)

      when /^"([^"]*)" content page$/
        content = Content.find_by_title!($1)
        project_content_path(content.project, content)

      else
        begin
          page_name =~ /^the (.*) page$/
          path_components = $1.split(/\s+/)
          self.send(path_components.push('path').join('_').to_sym)
        rescue NoMethodError, ArgumentError
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                    "Now, go and add a mapping in #{__FILE__}"
        end
    end
  end
end

World(NavigationHelpers)
