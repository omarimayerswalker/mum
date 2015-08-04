class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :image_url
      t.text :key_word

      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
