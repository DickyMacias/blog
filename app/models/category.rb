# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :has_categories
  has_many :articles, through: :has_categories
end
