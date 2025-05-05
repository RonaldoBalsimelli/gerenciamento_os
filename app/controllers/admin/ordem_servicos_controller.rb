require 'rest-client' # Certifique-se de adicionar isso no seu Gemfile e rodar `bundle install`
require 'json'

class Admin::OrdemServicosController < ApplicationController
  # Este é um exemplo usando a API Nominatim do OpenStreetMap.
  def geocode(endereco)
    # Lógica para chamar a API de geocodificação Nominatim
    # Retornar um hash com latitude e longitude
    response = RestClient.get("https://nominatim.openstreetmap.org/search?format=json&q=#{URI.encode_www_form_component(endereco)}")
    json = JSON.parse(response.body)
    if json.present? && json.first.present?
      { latitude: json.first['lat'], longitude: json.first['lon'] }
    else
      { latitude: nil, longitude: nil } # Tratar erros
    end
  rescue RestClient::Exception => e
    Rails.logger.error "Geocoding error: #{e.message}"
    { latitude: nil, longitude: nil }
  end

  def create
    @ordem_servico = OrdemServico.new(ordem_servico_params)

    # Obter a geolocalização do endereço do cliente (ou técnico, ou local da OS)
    endereco = @ordem_servico.cliente.endereco # ou qualquer campo que tenha o endereço
    geolocalizacao = geocode(endereco)
    @ordem_servico.latitude_inicio = geolocalizacao[:latitude]
    @ordem_servico.longitude_inicio = geolocalizacao[:longitude]

    if @ordem_servico.save
      redirect_to admin_ordem_servicos_path, notice: 'Ordem de serviço criada com sucesso.'
    else
      # ...
    end
  end
  #...

  private

  def ordem_servico_params
    params.require(:ordem_servico).permit(:cliente_id, :tecnico_id, :descricao_problema, :equipamento, :data_inicio, :data_fim, :assinatura_cliente, :status, :latitude_inicio, :longitude_inicio, :latitude_fim, :longitude_fim)
  end
end