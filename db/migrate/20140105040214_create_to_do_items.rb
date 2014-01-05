class CreateToDoItems < ActiveRecord::Migration
  def change
    create_table :to_do_items do |t|
      t.belongs_to :project, index: true
      t.string :description
      t.boolean :done

      t.timestamps
    end
  end
end
