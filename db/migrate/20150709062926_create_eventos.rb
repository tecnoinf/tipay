class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|

      t.string :titulo
      t.text :cuerpo
      t.date :fecha
      t.string :inicio
      t.string :archivo

      t.timestamps
    end
  end
end
