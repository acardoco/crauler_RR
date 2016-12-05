require 'infoEmpleoCrawler'

class OffersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def destroy
  end

  def stats

  	@ofertasInfoEmpleo = Array.new

  	getAllPagesInfoEmpleo(2, @ofertasInfoEmpleo)

  	@sizeInforEmpleo = @ofertasInfoEmpleo.length

  end

  #esto esta siendo un metodo de prueba de momento
  helper_method :integrateOffers

  def integrateOffers
  	prueba = Array.new

	getAllPagesInfoEmpleo(2, prueba)

	prueba.each do |offer|
		puts offer.getOferta
	end
  end

end
