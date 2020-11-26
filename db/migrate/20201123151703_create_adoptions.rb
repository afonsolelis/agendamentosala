class CreateAdoptions < ActiveRecord::Migration[6.0]
  def change
    create_table :adoptions do |t|
      t.references :user
      t.references :animal
      t.timestamps
    end
  end
end
