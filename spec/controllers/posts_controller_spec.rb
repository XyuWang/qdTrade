require 'spec_helper'

describe PostsController do
  let(:user) {create :user}
  
  describe "GET 'new'" do
    context "user not signed in " do
      it "shoud return error" do
        get 'new'
        response.should_not be_success
      end 
    end
    
    context "user signed in " do
      before do
        sign_in user
      end
      it "returns http success" do
        get 'new'
        response.should be_success
      end
    end
  end

  describe "GET 'show'" do
    let(:public_post) {create :post, public: true}
    let(:hidden_post) {create :post, public: false, user_id: user.id}

    context "public post" do
      it "returns http success" do
        get 'show', id: public_post.id
        response.should be_success
      end
    end
    
    context "hidden post" do
      context "view by creater" do
        before {sign_in user}
        
        it "should return success" do
          get 'show', id: hidden_post.id
          response.should be_success
        end
      end
      
      context "view by other" do
        before {sign_in create(:user)}
        
        it "should return failed" do
          get 'show', id: hidden_post.id
          response.should_not be_success
        end
      end
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end
  
  describe "#create" do
    let(:arguments) { {post: {school_id: 1, category_id: 1, title: "title", content: "content", price: "1.0", contact: "123", public: true}}}
    
    context "user not signed in " do
      it "should not create" do
        lambda do
           post :create, arguments 
         end.should change(Post, :count).by 0

        response.should redirect_to new_user_session_path
      end
    end
    
    context "user signed in " do
      before do
        sign_in user
      end
      
      it "should create new post" do
        lambda { post :create, arguments }.should change(Post, :count).by 1
      end
    end
  end
end
