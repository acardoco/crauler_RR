require 'restclient'
require 'base64'

def getInfoJobsOffers
	infoJobsCompanyURL = "/api/1/profile/"
	infoJobsOffersURL = "/api/1/offer?page=1"
	callbakcUrl = 'https://api.infojobs.net/api/1/oauth2'

	numPaginas = 1
	max = 1

	username = "5657566713114d71b71516ba9395d4ae"
	password = "cmo+EdVRuqQyEwGQRV4H5J5+lITBAoTPLHr+rwLmRu5EoD7WHJ"

	target_host = "api.infojobs.net"



	auth = "Basic " + Base64::strict_encode64("#{username}:#{password}")
	while numPaginas <= max do
		response = RestClient.get("api.infojobs.net/api/1/offer?page=#{numPaginas}",:authorization=>auth)
		numPaginas+=1
	end

	puts response

end

puts getInfoJobsOffers