require 'rails_helper'

RSpec.describe Snippet, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:snippet)).to be_valid
  end

  it 'is invalid without a text' do
    expect(FactoryGirl.build(:snippet, text: nil)).to_not be_valid
  end

  it 'should create access token when snippet is private' do
    snippet_1 = FactoryGirl.create(:snippet, private: true)
    expect(snippet_1.access_token).not_to be_nil
  end

  it 'should not create access token when snippet is public' do
    snippet_1 = FactoryGirl.create(:snippet, private: false)
    expect(snippet_1.access_token).to be_nil
  end

end
