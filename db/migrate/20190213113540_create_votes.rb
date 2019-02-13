class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|

      t.references :user, foreign_key: true
      t.references :answer, foreign_key: true
      t.boolean :value

      t.timestamps
    end
  end
end
