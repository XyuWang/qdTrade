class Post < ActiveRecord::Base
  belongs_to :school
  belongs_to :user
  belongs_to :type
  belongs_to :category

  validates :school_id, :user_id, :category_id, :type_id, :title, :content, :contact, :price, :status, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :status, inclusion: {in: [0, 1]} # 0:hide 1:show
end
