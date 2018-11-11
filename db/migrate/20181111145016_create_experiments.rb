class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :story

      t.timestamps null: false
    end
  end
end
