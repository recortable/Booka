class VersionsController < ApplicationController
  respond_to :html
  expose(:versions) { Version.order('id DESC') }
  expose(:version)

  def index
    authorize! :read, Version
  end

  def show
    project = Project.find(version.project_id)
    url = case version.item_type
            when 'Project'
              project_path(project)
            when 'BookaLine'
              booka_line_path(BookaLine.find(version.item_id))
            when 'Comment'
              Comment.find(version.item_id).locate_resource
            when 'Content'
              project_content_path(project, Content.find(version.item_id))
            when 'Topic'
              project_topic_path(project, Topic.find(version.item_id))
            when 'Post'
              project_post_path(project, Post.find(version.item_id))
            when 'Response'
              project_topic_path(project, Response.find(version.item_id).topic, :anchor => "#{version.sub_type.downcase}_#{version.item_id}")
          end

    url.present? ? redirect_to(url) : render(:text => version.item_type)
  end
end
