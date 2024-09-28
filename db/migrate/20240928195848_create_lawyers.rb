class CreateLawyers < ActiveRecord::Migration[7.1]
  def change
    create_table :lawyers do |t|
      t.string :name
      t.string :title
      t.text :bio
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
