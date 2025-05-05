class Admin::OrdemServicosController < ApplicationController
  def index
    @ordem_servicos = OrdemServico.all
  end

  def new
    @ordem_servico = OrdemServico.new
    @clientes = Cliente.all # Para exibir a lista de clientes no formulário
    @tecnicos = Tecnico.all # Para exibir a lista de técnicos no formulário
  end

  def create
    @ordem_servico = OrdemServico.new(ordem_servico_params)
    if @ordem_servico.save
      redirect_to admin_ordem_servicos_path, notice: 'Ordem de serviço criada com sucesso.'
    else
      @clientes = Cliente.all
      @tecnicos = Tecnico.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ordem_servico = OrdemServico.find(params[:id])
    @clientes = Cliente.all # Para exibir a lista de clientes no formulário
    @tecnicos = Tecnico.all # Para exibir a lista de técnicos no formulário
  end

  def update
    @ordem_servico = OrdemServico.find(params[:id])
    if @ordem_servico.update(ordem_servico_params)
      redirect_to admin_ordem_servicos_path, notice: 'Ordem de serviço atualizada com sucesso.'
    else
      @clientes = Cliente.all
      @tecnicos = Tecnico.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ordem_servico = OrdemServico.find(params[:id])
    @ordem_servico.destroy
    redirect_to admin_ordem_servicos_path, notice: 'Ordem de serviço excluída com sucesso.'
  end

  def validar
    @ordem_servico = OrdemServico.find(params[:id])
    @ordem_servico.update(status: 'aguardando_aprovacao') # Ou 'concluída', dependendo do seu fluxo
    redirect_to admin_ordem_servicos_path, notice: 'Ordem de serviço marcada para validação.'
  end

  private

  def ordem_servico_params
    params.require(:ordem_servico).permit(:cliente_id, :tecnico_id, :descricao_problema, :equipamento, :data_inicio, :data_fim, :assinatura_cliente, :status, :latitude_inicio, :longitude_inicio, :latitude_fim, :longitude_fim)
  end
end
