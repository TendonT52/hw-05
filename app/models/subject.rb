class Subject < ApplicationRecord
  validates :name, presence: true
  validates :score, numericality: { only_integer: true }, presence: true


end
