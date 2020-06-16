class CreateReclucks < ActiveRecord::Migration[6.0]
  def change
    create_table :reclucks do |t|
      t.references :cluck, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
