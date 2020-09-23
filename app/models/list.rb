class List < ApplicationRecord
  has_many :entries, dependent :destroy
end
