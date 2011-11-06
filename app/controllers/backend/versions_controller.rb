class Backend::VersionsController < Backend::ApplicationController
  respond_to :html
  expose(:versions) { Version.order('id DESC').limit(50) }
  expose(:version)

  expose(:collection) { versions }
  expose(:resource) { version }
  expose(:resource_class) { Version }

  def index

  end

  def show

  end

  def destroy
    version.destroy
    redirect_to [:backend, :versions]
  end
end