class AddAccessTokenToSnippet < ActiveRecord::Migration
  def change
    add_column :snippets, :access_token, :string
  end
end
