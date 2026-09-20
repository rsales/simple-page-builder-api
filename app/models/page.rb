class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  field :project_id, type: Integer
  field :schema_id, type: BSON::ObjectId
  field :title, type: String
  field :slug, type: String
  field :type, type: String
  field :data, type: Hash, default: {}

  validates :project_id, presence: true
  validates :schema_id, presence: true
  validates :title, presence: true
  validates :slug, presence: true

  before_create :set_type_from_schema

  private

  def set_type_from_schema
    schema = PageSchema.where(_id: schema_id).first

    unless schema
      errors.add(:schema_id, "Schema not found")
      throw(:abort)
    end

    unless %w[Page Component].include?(schema.type)
      errors.add(:schema_id, 'Schema type must be "Page" or "Component"')
      throw(:abort)
    end

    self.type = schema.type
  end
end
