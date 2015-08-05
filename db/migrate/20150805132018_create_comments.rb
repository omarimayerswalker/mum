class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :photo_url

      t.belongs_to :image

      t.timestamps null: false
    end
  end
end
