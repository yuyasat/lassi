require 'csv'

module Import::Plans
  module_function

  def execute!
    csv_path = Rails.root.join('lib', 'assets', 'datas', 'plan.csv')
    csv_data = CSV.read(csv_path, headers: true)

    provider = nil
    carrier = nil
    name = nil

    csv_data.each_with_index do |data, i|
      next if data['visible'] == 'FALSE'

      provider = if data['provider_key'].present?
                   Provider.find_by(key: data['provider_key'])
                 else
                   provider
                 end
      carrier = data['carrier'].presence || carrier
      name = data['name'].presence || name

      attributes = {
        provider:  provider,
        carrier:   Plan.carriers[carrier],
        name:      name,
        parent_id: data['parent_key'].present? ? Plan.find_by(key: data['parent_key']).id : 0,
        data_num:          data['data_n'],
        sms_num:           data['sms_n'],
        voice_num:         data['sms_n'],
        capacity:          data['capacity'],
        price:             data['price'],
        down_speed:        data['down_speed'],
        up_speed:          data['up_speed'],
        voice_price:       data['voice_price'],
        sms_domestic:      data['sms_d'],
        sms_international: data['sms_i'],
        carry_over:        data['carry_over'],
      }

      plan = Plan.find_or_initialize_by(key: data['key'], provider: provider)
      plan.attributes = attributes

      if plan.new_record? || plan.changed?
        rails "plan.csv:#{i + 1}が保存に失敗しました" unless plan.save
      end
    end
  end
end
