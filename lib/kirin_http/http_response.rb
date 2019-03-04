class Response

	# @param [Object] content the body of the http request
	# @param [Hash] headers the headers of the http request
	# @param [Integer] code the status code of the http request
	def initialize(content, headers, code)
		@content = content
		@header = headers
		@code = code
	end

	# Gets the content of the Http Request made.
	# This can be any type, please check headers for Content-Type to verify
	#
	# @return [Object]
	def content
		@content
	end

	# Returns the header as hash
	#
	# @return [Hash]
	def header
		@header
	end

	# Returns the status code as integer
	#
	# @return [Integer]
	def code
		@code
	end

end
