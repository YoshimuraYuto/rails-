class App < ApplicationRecord
  validates :content, presence: true
  validates :content, length: {in: 1..140}
end