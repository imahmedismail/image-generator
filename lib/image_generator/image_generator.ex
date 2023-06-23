defmodule ImageGenerator do
  @api_key "AIzaSyBVV0RcKZ9oCaL8n7hiVYlDKun45IAPsN8"
  @search_engine_id "c5fb6fb753c6b405c"

  alias HttpClient

  def generate_random_image(search_text) do
    search_results = perform_image_search(search_text)
    select_random_image_url(search_results)
  end

  def perform_image_search(search_text) do
    query =
      "https://www.googleapis.com/customsearch/v1?key=#{@api_key}&cx=#{@search_engine_id}&q=#{URI.encode_www_form(search_text)}&searchType=image"

    response = HttpClient.get_request(query)
    json_response = Jason.decode!(response.body)
    json_response["items"]
  end

  defp select_random_image_url(search_results) do
    random_result = Enum.random(search_results)
    random_result["link"]
  end
end
