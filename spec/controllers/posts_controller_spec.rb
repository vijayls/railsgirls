require 'spec_helper'


describe PostsController do
  before :each do
    post1 = Post.create(:title => 'title 1', :text => 'text 1')
    post2 = Post.create(:title => 'title 2', :text => 'text 2')
    post3 = Post.create(:title => 'title 3', :text => 'text 3')
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end

  describe 'index' do
    it 'should return all post' do
      get :index
      assert_response :success
      assigns(:posts).should == Post.all
    end
  end

  describe 'create' do
    it 'should create a post' do
      post :create, {:post => {:title => 'New title', :text => 'New text'}}
      response.should redirect_to Post.find_by_title('New title')
    end
  end

  describe 'new' do
    it 'should render new template' do
      get :new
      assert_response :success
      response.should render_template :new
      assigns[:post].should_not be_nil
    end
  end

  describe 'edit' do
    it 'should render edit post form' do
      get :edit, :id => 1
      assert_response :success
      response.should render_template :edit
      assigns[:post].should  == Post.find_by_id(1)
    end
  end

  describe 'show' do
    it 'should show details of a post' do
      get :show, :id => 1
      assert_response :success
      response.should render_template :show
      assigns[:post].should == Post.find_by_id(1)
    end

    it 'should show details of a post in json format' do
      get :show, :id => 1, :format => :json
      assert_response :success
      expected_post = Post.find_by_id(1)
      assigns[:post].should == expected_post
      response.body.should == expected_post.to_json
    end
  end

  describe 'update' do
    it 'should update a post' do
      put :update, {:post => {:title => 'new title', :text => 'new text'}, :id => 1}
      response.should  redirect_to post_path(Post.find_by_id(1))
    end
  end

  describe 'destroy' do
    it 'should destroy a post' do
      get :destroy, :id => 1
      response.should redirect_to posts_path
    end
  end
end