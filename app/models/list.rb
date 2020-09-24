class List < ApplicationRecord
  has_many :entries, dependent: :destroy
  belongs_to :user
  validates :list_name, length: { maximum: 140 }
end
