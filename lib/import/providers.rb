require 'csv'

module Import::Providers
  module_function

  def execute!
    csv_path = Rails.root.join('lib/assets/datas/provider.csv')
    csv_data = CSV.read(csv_path, headers: true)

    csv_data.each do |provider_data|
      attributes = { key: provider_data['key'], name: provider_data['name'] }
      provider = Provider.find_or_initialize_by(attributes)
      provider.save! if provider.changed?
    end
  end
end
