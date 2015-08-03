class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :image_url
      t.text :key_words

      t.timestamps null: false
    end
  end
end
