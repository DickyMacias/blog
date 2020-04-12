# frozen_string_literal: true

class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_many :has_categories
  has_many :categories, through: :has_categories
  attr_accessor :category_elements

  def save_categories
    # category_elements
    # convertirlo en []
    # categories_array = category_elements.split(',')
    # iterar []
    category_elements.each do |category_id|
      # crear HasCategory HasCategory<article_id: 1, category_id: 1
      # unless HasCategory.where(article: self,category_id: category_id).any?
      HasCategory.find_or_create_by(article: self, category_id: category_id)
      # end
    end
  end
end
