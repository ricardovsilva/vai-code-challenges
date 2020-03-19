class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :description
      t.string :owner
      
      t.timestamps
    end
  end
end
