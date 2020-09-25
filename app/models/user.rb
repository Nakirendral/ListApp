class User < ApplicationRecord
  has_many :lists, dependent: :destroy
end
