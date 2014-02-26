class Post < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks
  belongs_to :school
  belongs_to :user
  belongs_to :category

  validates :school_id, :user_id, :category_id, :title, :content, :contact, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  
  scope :public, -> {where(public: true)}
  scope :hidden, -> {where(public: false)}
end
