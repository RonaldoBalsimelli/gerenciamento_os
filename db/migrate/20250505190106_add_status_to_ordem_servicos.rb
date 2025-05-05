class AddStatusToOrdemServicos < ActiveRecord::Migration[7.1] # ou a versão do Rails que você está usando
  def change
    unless column_exists?(:ordem_servicos, :status)
      add_column :ordem_servicos, :status, :string, default: 'Pendente'
    end
  end
end