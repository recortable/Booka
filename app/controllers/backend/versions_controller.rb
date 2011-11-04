class Backend::VersionsController < Backend::ApplicationController
  expose(:collection) { Version.order('id DESC').limit(50)}
  expose(:resource_class) { Version }

  def index

  end
end