class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.integer :upvotes

      t.timestamps
    end
  end
end
