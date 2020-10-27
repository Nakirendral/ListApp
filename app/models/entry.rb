class Entry < ApplicationRecord
  belongs_to :list
  validate :content, :list_id
  validates_associated :list
end
