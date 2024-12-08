class AddTimestampsToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :created_at, :datetime
    add_colmun :articles, :updated_at, :datetime
  end
end
