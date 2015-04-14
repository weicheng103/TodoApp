class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.boolean :is_done

      t.timestamps null: false
    end
  end
end
