class CreateSingle < ActiveRecord::Migration
  def change
    create_table :singles do |t|
      t.string :fb_id
      t.string :pic_url
      t.string :gender
      t.string :age
      t.string :race
      t.integer :couple_id
      t.timestamps
    end
  end
end
