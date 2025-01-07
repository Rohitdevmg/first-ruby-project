class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :votable, polymorphic: true, null: false
      t.string :user
      t.boolean :vote_type

      t.timestamps
    end
  end
end
