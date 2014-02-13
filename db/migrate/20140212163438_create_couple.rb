class CreateCouple < ActiveRecord::Migration
  def change
    create_table :couples do |t|
      t.string :original_fb_id
      t.string :couple_pic
      t.string :self_id
      t.string :partner_id
      t.timestamps
    end
  end
end
