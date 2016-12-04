class Offer
  include Mongoid::Document
  field :nombre_oferta, type: String
  field :nombre_empresa, type: String
  field :localizacion, type: String
  field :descrp_oferta, type: String
  field :responsabilidad, type: String
  field :tipo_jornada, type: String
  field :experiencia, type: String
end
