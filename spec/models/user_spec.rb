require 'spec_helper'

describe User do
  it "should validate uniqueness of nickname" do
    emily = create :user, nickname: "emily"
    emma = build :user, nickname: "emily"

    lambda {emma.save}.should change(User, :count).by 0
  end

  describe "renren_url" do
    let!(:user) {create :user}

    it "should permit valid renren url" do
      user.renren_url = "http://renren.com/123"
      user.should be_valid
    end

    it "should not permit invalid renren url" do
      user.renren_url = "http://baidu.com/"
      user.should be_valid
    end
  end
end
