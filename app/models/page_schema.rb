class PageSchema
  include Mongoid::Document
  include Mongoid::Timestamps

  field :project_id, type: Integer
  field :name, type: String
  field :slug, type: String
  field :type, type: String
  field :schema_fields, type: Array
  field :component_name, type: String
end
