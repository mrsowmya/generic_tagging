class Entity < ApplicationRecord
	serialize :tags, Array

	validates :entity_type, :identifier, :tags, presence: true
	validates :entity_type, :identifier, uniqueness: true
end
