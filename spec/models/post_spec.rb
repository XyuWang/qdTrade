require 'spec_helper'

describe Post do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:type_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:contact) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:status) }

  it { should ensure_inclusion_of(:status).in_range(0..1) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
end
