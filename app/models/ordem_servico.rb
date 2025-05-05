class OrdemServico < ApplicationRecord
  belongs_to :cliente
  belongs_to :tecnico

  STATUSES = ['Pendente', 'Concluído', 'Necessário Peça', 'Não Concluído', 'Necessário Retorno'].freeze # Adicionando freeze

  validates :status, inclusion: { in: STATUSES } # Validação no model
  # ... outros validations
end