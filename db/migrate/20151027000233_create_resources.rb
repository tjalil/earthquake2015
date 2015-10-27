class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.text :website_link
      t.string :contact_num
      t.text :description
      t.string :main_section
      t.string :sub_section

      t.timestamps null: false
    end
  end
end
