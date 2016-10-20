class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :name
      t.text :description
      t.integer :status, default: 0
      t.references :task, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :ends_at

      t.timestamps
    end
  end
end
