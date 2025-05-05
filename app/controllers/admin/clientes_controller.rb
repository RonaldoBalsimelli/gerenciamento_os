class Admin::ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      redirect_to admin_clientes_path, notice: 'Cliente criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @cliente = Cliente.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update(cliente_params)
      redirect_to admin_clientes_path, notice: 'Cliente atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy
    redirect_to admin_clientes_path, notice: 'Cliente excluído com sucesso.'
  end

  private

  def cliente_params
    params.require(:cliente).permit(:nome, :contato, :endereco)
  end
end
