class List < ApplicationRecord
  has_many :entries
  belongs_to :user
  validates :list_name, length: { maximum: 140 }
end
