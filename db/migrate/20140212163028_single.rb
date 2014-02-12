class Single < ActiveRecord::Migration
  def change
    create_table :singles do |t|
      t.string :fb_id
      t.string :pic_url
      t.timestamps
    end
  end
end
