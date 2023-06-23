defmodule ImageGeneratorWeb.UserLive.Index do
  use ImageGeneratorWeb, :live_view

  alias ImageGenerator.Accounts
  alias ImageGenerator.Accounts.User
  alias ImageGenerator
  alias ImageGenerator.Generator

  @impl true
  def mount(_params, _session, socket) do
    changeset = Generator.changeset(%Generator{}, %{title: nil})
    {:ok, socket |> assign(%{image_url: nil, form: to_form(changeset)})}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply,
     socket
     |> assign(:page_title, "Image Generator")}
  end

  @impl true
  def handle_event("generate-image", %{"generator" => %{"title" => search_params}}, socket) do
    {:noreply, socket |> assign(%{image_url: ImageGenerator.generate_random_image(search_params)})}
  end
end
