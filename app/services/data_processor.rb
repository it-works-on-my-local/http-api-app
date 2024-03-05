class DataProcessor
  def self.extract_info(data)
    data.map { |item| item['name'] }
  end
end
