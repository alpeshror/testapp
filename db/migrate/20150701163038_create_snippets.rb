class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.boolean :private, default: false
      t.text :text

      t.timestamps null: false
    end
  end
end
