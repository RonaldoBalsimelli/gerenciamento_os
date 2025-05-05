class CreateOrdemServicos < ActiveRecord::Migration[8.0]
  def change
    create_table :ordem_servicos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.references :tecnico, null: false, foreign_key: true
      t.text :descricao_problema
      t.string :equipamento
      t.datetime :data_inicio
      t.datetime :data_fim
      t.text :assinatura_cliente
      t.string :status
      t.decimal :latitude_inicio
      t.decimal :latitude_fim
      t.decimal :longitude_inicio
      t.decimal :longitude_fim

      t.timestamps
    end
  end
end
