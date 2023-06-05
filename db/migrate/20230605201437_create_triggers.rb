class CreateTriggers < ActiveRecord::Migration[7.0]
  def change
    create_table :triggers do |t|
			t.string :ts
      t.timestamps
    end
  end
end
