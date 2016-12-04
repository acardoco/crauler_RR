#para cargarla desde el crawler
require 'mongoid'

class Offer
  include Mongoid::Document
  field :nombre_oferta, type: String
  field :nombre_empresa, type: String
  field :localizacion, type: String
  field :descrp_oferta, type: String
  field :responsabilidad, type: String
  field :tipo_jornada, type: String
  field :experiencia, type: String


  def initialize( oferta, empresa, localizacion, desc, experiencia )
    @nombre_oferta = oferta
    @nombre_empresa = empresa
    @localizacion = localizacion
    @descrp_oferta = desc
    @experiencia = experiencia
  end

  def getOferta
  	@nombre_oferta
  end

  def getEmpresa
  	@nombre_empresa
  end

  # Getters y Setters ...

end
