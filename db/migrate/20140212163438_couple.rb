class Couple < ActiveRecord::Migration
  def change
    create_table :couples do |t|
      t.string :original_fb_id
      t.string :couple_pic
      t.string :self_pic
      t.string :partner_pic
      t.timestamps
    end
  end
end
