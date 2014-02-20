class Post < ActiveRecord::Base
  belongs_to :school
  belongs_to :user
  belongs_to :type
  belongs_to :category

  validates :school_id, :user_id, :category_id, :type_id, :title, :content, :contact, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  
  scope :public, -> {where(public: true)}
  scope :hidden, -> {where(public: false)}
end
