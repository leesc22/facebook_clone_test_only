class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
    	t.belongs_to :user, index: true, foreign_key: true
    	t.string :title
    	t.text :content
      t.timestamps
    end
  end
end
