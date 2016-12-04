# CONJUNTO de métodos para crawlear infoEmpleo con Nokigiri

require 'open-uri'
require 'nokogiri'
require './app/models/offer.rb'

def getNombreOferta(doc, list)

  		@doc.xpath("//h2//a").each do |link|
  			list << (link.content)
  		end
end


def getNombreEmpresa(doc, list)
	filtrador = 0

	@doc.xpath('//li//p[contains(@class, "block")]').each do |link|
		if filtrador == 0
			list << (link.content)
		elsif filtrador == 2
			filtrador = 0
			next
		end
		filtrador += 1
	end
end

def getLocalizacion(doc, list)
	filtrador = 0

	@doc.xpath('//li//p[contains(@class, "block")]').each do |link|
		if filtrador == 1
			list << (link.content)
		elsif filtrador == 2
			filtrador = 0
			next
		end
		filtrador += 1
	end
end

def getDescripcion(doc, list)
  		@doc.xpath('//li//p[contains(@class, "description")]').each do |link|
  			list << (link.content)
  		end
end

def getExperiencia(doc, list)
  		@doc.xpath('//li//p[contains(@class, "small")]').each do |link|
  			list << (link.content)
  		end
end

def toOfertas(doc, list)
	nombres = Array.new
	empresas = Array.new
	localizaciones = Array.new
	descriptions = Array.new
	experiencias = Array.new

	getNombreOferta(doc, nombres)
	getNombreEmpresa(doc, empresas)
	getLocalizacion(doc, localizaciones)
	getDescripcion(doc, descriptions)
	getExperiencia(doc, experiencias)

	ofertas = Array.new

	contador = 0

	while contador < nombres.size do

		nombre = nombres[contador]
		empresa = empresas[contador]
		loc = localizaciones[contador]
		des = descriptions[contador]
		exp = experiencias[contador]

		offer = Offer.new(nombre, empresa, loc, des, exp)

		list << offer

		contador +=1

	end

end

def getAllPagesInfoEmpleo(numPaginas, ofertasTotales)

	pagina = 1

	@doc = Nokogiri::HTML(open("http://www.infoempleo.com/trabajo/"))


	while pagina <= numPaginas do
		if pagina <= 1
			toOfertas(@doc,ofertasTotales)
		else
			@doc2 = Nokogiri::HTML(open("http://www.infoempleo.com/trabajo/pagina_#{pagina}"))
			toOfertas(@doc2,ofertasTotales)
		end

		pagina +=1

	end


end


# estas líneas son para probar, quitarlas si es preciso:

prueba = Array.new

getAllPagesInfoEmpleo(2, prueba)

prueba.each do |offer|
	puts offer.getOferta
#--------------------------------------------------------
end

