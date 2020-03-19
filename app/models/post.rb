class Post < ApplicationRecord
  validates :summary, {presence: true, length: {maximum: 30}}
  validates :detail, {presence: true, length: {maximum: 400}}
  validates :deal_with_policy, {presence: true, length: {maximum: 50}}
  validates :deal_with_policy, {presence: true, length: {maximum: 600}}
end
