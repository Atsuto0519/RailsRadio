class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string :title
      t.string :subtitle
      t.string :pages
      t.integer :month

      t.timestamps
    end
  end
end
