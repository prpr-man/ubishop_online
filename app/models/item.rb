class Item < ActiveRecord::Base
  validates :name, presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}, presence: true
  validates :stock, numericality: {only_integer: true, greater_than_or_equal_to: 0}, presence: true
  validates :barcode, format: { :with => /\d+/, :message => "半角数字のみ入力できます" }, presence: true
  validates :category, presence: true
end
