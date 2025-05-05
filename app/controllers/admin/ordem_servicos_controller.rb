class Admin::OrdemServicosController < ApplicationController
  def index
    @ordem_servicos = OrdemServico.all
  end

  def new
    @ordem_servico = OrdemServico.new
    @clientes = Cliente.all
    @tecnicos = Tecnico.all
  end

  def create
    @ordem_servico = OrdemServico.new(ordem_servico_params)
    if @ordem_servico.save
      redirect_to admin_ordem_servicos_path, notice: 'Ordem de serviço criada com sucesso.'
    else
      @clientes = Cliente.all
      @tecnicos = Tecnico.all
      flash.now[:alert] = 'Erro ao criar ordem de serviço.' # Mantém a mensagem na mesma página
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ordem_servico = OrdemServico.find(params[:id])
    @clientes = Cliente.all
    @tecnicos = Tecnico.all
  end

  def update
    @ordem_servico = OrdemServico.find(params[:id])
    if @ordem_servico.update(ordem_servico_params)
      redirect_to admin_ordem_servicos_path, notice: 'Ordem de serviço atualizada com sucesso.'
    else
      @clientes = Cliente.all
      @tecnicos = Tecnico.all
      flash.now[:alert] = 'Erro ao atualizar ordem de serviço.' # Mantém a mensagem na mesma página
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
    novo_status = params[:status] # Pega o status enviado pelo formulário
    if @ordem_servico.update(status: novo_status)
      redirect_to admin_ordem_servicos_path, notice: "Ordem de serviço marcada como #{novo_status}."
    else
      redirect_to admin_ordem_servicos_path, alert: 'Erro ao alterar o status da ordem de serviço.'
    end
  end

  private

  def ordem_servico_params
    params.require(:ordem_servico).permit(:cliente_id, :tecnico_id, :descricao_problema, :equipamento, :data_inicio, :data_fim, :assinatura_cliente, :status, :latitude_inicio, :longitude_inicio, :latitude_fim, :longitude_fim)
  end
end
