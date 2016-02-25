module Viewer
  class Project
    include MongoMapper::Document

    key :name, String
    many :features, :class => Viewer::Feature
  end
end
