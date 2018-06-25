class AddColumnToYoutubes < ActiveRecord::Migration[5.0]
  def change
    add_column :youtubes, :url, :string
    add_column :youtubes, :value, :integer
    add_column :youtubes, :content, :text
  end
end
