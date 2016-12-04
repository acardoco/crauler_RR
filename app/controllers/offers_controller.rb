require 'open-uri'


class OffersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def destroy
  end
  	def parserInfoEmpleo

  		
  		@doc = Nokogiri::HTML(open("http://www.infoempleo.com/trabajo/"))
  		puts @doc.xpath("//h2//a")
  	end

end
