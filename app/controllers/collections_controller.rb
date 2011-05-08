class CollectionsController < ApplicationController
  respond_to :html
  expose(:collections) { Collection.all }
  expose(:collection)

  def index
  end

end
