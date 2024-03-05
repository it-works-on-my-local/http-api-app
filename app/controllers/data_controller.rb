class DataController < ApplicationController
  def fetch
    endpoint = '/data'
    @data = ApiService.fetch_data(endpoint)

    if @data.present?
      @info = DataProcessor.extract_info(@data)

      File.open('output.txt', 'w') do |file|
        @info.each { |item| file.puts item }
      end

      flash[:success] = "Text file generated successfully at #{Rails.root.join('output.txt')}"
    else
      flash[:error] = "Failed to fetch data from the API. Please try again later."
    end

    redirect_to root_path
  end
end
