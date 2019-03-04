require "kirin_http"
require "json"

describe KirinHttp do
	it "has a version number" do
		expect(KirinHttp::VERSION).not_to be nil
	end

	describe KirinHttp::BasicClient do
		it 'should be able to query API with correct headers' do
			endpoint = "https://jsonplaceholder.typicode.com/todos/1"
			headers = {"Content-Type": "application/json", "Accept": "application/json"}
			client = KirinHttp::BasicClient.new
			message = KirinHttp::Message.new endpoint, :get, nil, headers

			expected_message = {
				userId: 1,
				id: 1,
				title: "delectus aut autem",
				completed: false
			}.to_json

			resp = client.send message
			expect(resp.code).to eq(200)
			expect(JSON.parse(resp.content).to_json).to eq(expected_message)
		end
	end

end
