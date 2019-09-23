class App < ApplicationRecord
  validates :content, presence: true
  validates :name, length: {in: 1..140}
end
