defmodule Restclient do
	use HTTPotion.Base
	HTTPotion.start
	server = "http://admin:admin@10.55.17.20:8080"
	path = "/controller/nb/v2/statistics/default/flowstats"
	b = HTTPotion.get(server <> path).body
	{:ok, d} = JSON.decode(b)
	Dict.fetch(d, "flowStatistics")
	def get_host() do
		"10.55.17.20:8080"
	end
	def process_url(url) do
		baseurl = "http://" <> "admin" <> ":" <> "admin" <> "@" <> get_host
		baseurl <> url
	end
	def process_response_body(body) do
		{:ok, json} = JSON.decode(to_binary body)
		json
	end

	def get_flow_stats() do
		path = "/controller/nb/v2/statistics/default/flowstats"
		Restclient.get(path).body["flowStatistics"]
	end
	
	def get_flow_stats(node_id), do: 
		Enum.find(Restclient.get_flow_stats, fn(x) -> x["node"]["@id"] == node_id end)

	
end
