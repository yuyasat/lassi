module Import::Terminals
  module_function

  def execute!(carrier)
    csv_path = Rails.root.join('lib', 'assets', 'datas', "#{carrier}_terminals.csv")
    csv_data = CSV.read(csv_path, headers: true)

    maker = nil

    csv_data.each_with_index do |data, i|
      next if i == 0

      maker = if data['maker'].present?
                Maker.find_or_initialize_by(name: data['maker'])
              else
                maker
              end

      true_values = ['◯', '1']
      attributes = {
        carrier:     carrier,
        band1:       data['Band1'].in?(true_values),
        band3:       data['Band3'].in?(true_values),
        band8:       data['Band3'].in?(true_values),
        band11:      data['Band3'].in?(true_values),
        band18_26:   data['Band18/26'].in?(true_values),
        band19:      data['Band19'].in?(true_values),
        band21:      data['Band21'].in?(true_values),
        band28:      data['Band28'].in?(true_values),
        wc_band1:    data['W-CDMA-I'].in?(true_values),
        wc_band6_19: data['W-CDMA-VI/XIX'].in?(true_values),
        wc_band8:    data['W-CDMA-VIII'].in?(true_values),
        wc_band9:    data['W-CDMA-IX'].in?(true_values),
        wc_band11:   data['W-CDMA-XI'].in?(true_values),
      }
      terminal = Terminal.find_or_initialize_by(name: data['name'], maker: maker)
      terminal.attributes = attributes

      if terminal.new_record? || terminal.changed?
        rails "plan.csv:#{i + 1}が保存に失敗しました" unless terminal.save
      end
    end
  end
end
