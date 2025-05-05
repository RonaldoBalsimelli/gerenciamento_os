class CreateTecnicos < ActiveRecord::Migration[8.0]
  def change
    create_table :tecnicos do |t|
      t.string :nome
      t.string :contato
      t.string :especialidade

      t.timestamps
    end
  end
end
