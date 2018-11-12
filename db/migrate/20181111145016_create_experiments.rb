class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :story
      t.integer :branch_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
