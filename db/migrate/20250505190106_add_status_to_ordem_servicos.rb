class AddStatusToOrdemServicos < ActiveRecord::Migration[8.0]
  def change
    # add_column :ordem_servicos, :status, :string, default: 'Pendente'  # commented out to prevent duplicate column error
    unless column_exists?(:ordem_servicos, :status)
      add_column :ordem_servicos, :status, :string, default: 'Pendente'
    end
  end