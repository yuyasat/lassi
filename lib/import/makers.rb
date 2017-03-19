module Import::Makers
  module_function

  def execute!(carrier)
    csv_path = Rails.root.join('lib', 'assets', 'datas', "#{carrier}_terminals.csv")
    csv_data = CSV.read(csv_path, headers: true)

    csv_data.each_with_index do |data, i|
      next if data['maker'].blank?

      maker = Maker.find_or_initialize_by(name: data['maker'])
      maker.save! if maker.new_record?
    end
  end
end
