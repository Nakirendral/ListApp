class List < ApplicationRecord
  attr_accessor :list_name
  has_many :entries, dependent: :destroy
  belongs_to :user
  validates :title, length: { maximum: 140 }
end
