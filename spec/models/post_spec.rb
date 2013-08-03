require 'spec_helper'
describe 'Post' do
  before :each do

  end

  it 'should create a valid post' do
    post = Post.create(:title => 'title', :text => 'text')
    post.should be_valid
    Post.destroy(post)
  end

end