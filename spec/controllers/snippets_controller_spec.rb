require 'rails_helper'

RSpec.describe SnippetsController, :type => :controller do

  describe "GET index" do
    it "returns existing snippets" do
      snippet_1 = FactoryGirl.create(:snippet)
      snippet_2 = FactoryGirl.create(:snippet)
      get :index
      expect(assigns(:snippets)).to match_array([snippet_1, snippet_2])
    end
  end

  describe "GET new" do
    it "returns instance of Snippet" do
      get :new
      expect(assigns(:snippet)).to be_a_new(Snippet)
    end
  end

  describe "GET show" do
    it "returns exisitng snippet" do
      snippet_1 = FactoryGirl.create(:snippet)
      get :show, id: snippet_1.id
      expect(assigns(:snippet)).to match snippet_1
    end
  end

  describe "GET private_snippet" do
    it "returns exisitng private snippet" do
      snippet_1 = FactoryGirl.create(:snippet, private: true)
      get :private_snippet, access_token: snippet_1.access_token
      expect(assigns(:snippet)).to match snippet_1
    end
  end

  describe "POST snippet" do
    it "should create snippet" do
      post :create, snippet: {text: "Text", private: true}
      expect(Snippet.count).to eq(1)
    end
  end

end