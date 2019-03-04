require "net/http"

module KirinHttp
	class Client
		# Sends the http message
		# @param [Message] request the request to send
		# @return [Response]
		def send(request)
			raise NotImplementedError
		end
	end

	class BasicClient < Client
		def send(request)
			http = Net::HTTP.new request.host, request.port
			http.use_ssl = request.ssl
			case request.method
				when :get
					type = Net::HTTP::Get
				when :post
					type = Net::HTTP::Post
				when :put
					type = Net::HTTP::Put
				when :patch
					type = Net::HTTP::Patch
				when :delete
					type = Net::HTTP::Delete
				when :head
					type = Net::HTTP::Head
				else
					raise NoMethodError "Unknown HTTP verb #{request.method.to_s}"
			end
			req = type.new(request.path, request.header)
			req.body = request.content unless request.content.nil?
			resp = http.request(req)
			Response.new(resp.body, resp.to_hash, resp.code.to_i)
		end
	end

end