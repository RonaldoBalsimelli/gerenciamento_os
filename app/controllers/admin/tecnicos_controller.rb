class Admin::TecnicosController < ApplicationController
  def index
    @tecnicos = Tecnico.all
  end

  def new
    @tecnico = Tecnico.new
  end

  def create
    @tecnico = Tecnico.new(tecnico_params)
    if @tecnico.save
      redirect_to admin_tecnicos_path, notice: 'Técnico criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tecnico = Tecnico.find(params[:id])
  end

  def update
    @tecnico = Tecnico.find(params[:id])
    if @tecnico.update(tecnico_params)
      redirect_to admin_tecnicos_path, notice: 'Técnico atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tecnico = Tecnico.find(params[:id])
    @tecnico.destroy
    redirect_to admin_tecnicos_path, notice: 'Técnico excluído com sucesso.'
  end

  private

  def tecnico_params
    params.require(:tecnico).permit(:nome, :contato, :especialidade)
  end
end
