module KirinHttp
	class Message
		attr_reader :host, :port, :path, :ssl, :header, :uri
		attr_accessor :method, :content

		# Constructor
		#
		# endpoint = "https://host.com/post/1?id=5"
		# data = {"id":5, "name":"John", "country": "singapore"}
		# headers = {"Content-Type": "application/json", "Accept": "text/plain"}
		# message = KirinHttpClient::HttpMessage.new(endpoint, :post, data.to_json, headers)
		# # Use HttpClient to send the message
		#
		# @param [String] url the full endpoint to query
		# @param [Symbol] method the http verb. Accepted symbols :get :post :put :patch :delete :head. Default is :get
		# @param [Object] content the request body. Can be any type. Defaults to nil. Put nil if there is no body
		# @param [Hash] header the header of the request. Defaults to empty hash
		def initialize(url, method = :get, content = nil, header = {})
			uri = URI.parse(url)
			@host = uri.host
			@port = uri.port
			@path = uri.request_uri
			@ssl = uri.scheme == "https"
			@header = header
			@header["Host"] = uri.host
			@method = method
			@content = content
			@uri = url
		end

		# Endpoint of the Http Message
		# @param [String] value the endpoint in full
		def url=(value)
			uri = URI.parse(value)
			@host = uri.host
			@port = uri.port
			@path = uri.request_uri
			@ssl = uri.scheme == "https"
			@uri = value
			@header["Host"] = uri.host
		end

		# Header of the HttpMessage
		# @param [Hash] value the header
		def header=(value)
			@header = value
			@header["Host"] = @host
		end
	end
end