class AddColumnToKnowledgeBases < ActiveRecord::Migration
  def change
    add_column :knowledge_bases, :article_code, :string
  end
end
