class Book < ApplicationRecord
  # validatesの定義-title,body
  validates :title , presence: true
  validates :body , presence: true
end
