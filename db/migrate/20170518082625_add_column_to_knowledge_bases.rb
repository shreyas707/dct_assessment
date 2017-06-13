class AddColumnToKnowledgeBases < ActiveRecord::Migration
  def change
    add_column :knowledge_bases, :links, :string
  end
end
