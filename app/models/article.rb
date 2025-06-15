# app/models/article.rb
class Article < ApplicationRecord
  # You might have a line like this that's causing the issue:
  # validates :content, presence: true
end
