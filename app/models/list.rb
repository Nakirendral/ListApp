class List < ApplicationRecord
  has_many :entries, dependent: :destroy
  belongs_to :user
  validates :title, length: { maximum: 140 }
end
