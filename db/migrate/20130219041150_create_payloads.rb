class CreatePayloads < ActiveRecord::Migration
  def change
    create_table :payloads do |t|
      t.text :params

      t.timestamps
    end
  end
end
