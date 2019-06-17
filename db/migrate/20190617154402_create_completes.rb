class CreateCompletes < ActiveRecord::Migration[5.2]
  def change
    create_table :completes do |t|
      t.boolean :listo , default:  false
      
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
