require 'rails_helper'

RSpec.describe Party, type: :model do
  describe '.active' do
    subject { Party.active(time) }

    context '2016年7月第24回参院選の場合' do
      let(:time) { Time.zone.local(2016, 6, 22) }

      let(:expectation) {
        [
          an_object_having_attributes(official_name: '自由民主党'),
          an_object_having_attributes(official_name: '日本共産党'),
          an_object_having_attributes(official_name: '社会民主党'),
          an_object_having_attributes(official_name: '民進党'),
          an_object_having_attributes(official_name: '公明党'),
          an_object_having_attributes(official_name: '日本を元気にする会'),
          an_object_having_attributes(official_name: '新党改革'),
          an_object_having_attributes(official_name: 'おおさか維新の会'),
          an_object_having_attributes(official_name: '日本のこころを大切にする党'),
          an_object_having_attributes(official_name: '生活の党と山本太郎となかまたち'),
        ]
      }
      it { is_expected.to contain_exactly(*expectation) }
    end

    context '2014年12月第24回衆院選の場合' do
      let(:time) { Time.zone.local(2014, 12, 2) }

      let(:expectation) {
        [
          an_object_having_attributes(official_name: '自由民主党'),
          an_object_having_attributes(official_name: '民主党'),
          an_object_having_attributes(official_name: '維新の党'),
          an_object_having_attributes(official_name: '公明党'),
          an_object_having_attributes(official_name: '次世代の党'),
          an_object_having_attributes(official_name: '日本共産党'),
          an_object_having_attributes(official_name: '生活の党'),
          an_object_having_attributes(official_name: '社会民主党'),
          an_object_having_attributes(official_name: '新党改革'),
        ]
      }
      it { is_expected.to contain_exactly(*expectation) }
    end

    context '2012年12月第23回衆院選の場合' do
      let(:time) { Time.zone.local(2012, 12, 5) }

      let(:expectation) {
        [
          an_object_having_attributes(official_name: '民主党'),
          an_object_having_attributes(official_name: '自由民主党'),
          an_object_having_attributes(official_name: '日本未来の党'),
          an_object_having_attributes(official_name: '公明党'),
          an_object_having_attributes(official_name: '日本維新の会'),
          an_object_having_attributes(official_name: '日本共産党'),
          an_object_having_attributes(official_name: 'みんなの党'),
          an_object_having_attributes(official_name: '社会民主党'),
          an_object_having_attributes(official_name: '国民新党'),
          an_object_having_attributes(official_name: '新党大地'),
          an_object_having_attributes(official_name: '新党改革'),
          an_object_having_attributes(official_name: '新党日本'),
          an_object_having_attributes(official_name: '国民の生活が第一'), # 党そのものは存在
          an_object_having_attributes(official_name: 'みどりの風'), # 公示日には政党要件を満たす
        ]
      }
      it { is_expected.to contain_exactly(*expectation) }
    end

    context '2012年12月6日の場合' do
      let(:time) { Time.zone.local(2012, 12, 6) }

      # みどりの風は12月5日に政党要件喪失
      let(:expectation) {
        [
          an_object_having_attributes(official_name: '民主党'),
          an_object_having_attributes(official_name: '自由民主党'),
          an_object_having_attributes(official_name: '日本未来の党'),
          an_object_having_attributes(official_name: '公明党'),
          an_object_having_attributes(official_name: '日本維新の会'),
          an_object_having_attributes(official_name: '日本共産党'),
          an_object_having_attributes(official_name: 'みんなの党'),
          an_object_having_attributes(official_name: '社会民主党'),
          an_object_having_attributes(official_name: '国民新党'),
          an_object_having_attributes(official_name: '新党大地'),
          an_object_having_attributes(official_name: '新党改革'),
          an_object_having_attributes(official_name: '新党日本'),
          an_object_having_attributes(official_name: '国民の生活が第一'), # 党そのものは存在
        ]
      }
      it { is_expected.to contain_exactly(*expectation) }
    end

    context '2012年12月29日の場合' do
      let(:time) { Time.zone.local(2012, 12, 29) }

      # みどりの風は12月28日に政党要件獲得
      let(:expectation) {
        [
          an_object_having_attributes(official_name: '民主党'),
          an_object_having_attributes(official_name: '自由民主党'),
          an_object_having_attributes(official_name: '公明党'),
          an_object_having_attributes(official_name: '日本維新の会'),
          an_object_having_attributes(official_name: '日本共産党'),
          an_object_having_attributes(official_name: 'みんなの党'),
          an_object_having_attributes(official_name: '社会民主党'),
          an_object_having_attributes(official_name: '新党改革'),
          an_object_having_attributes(official_name: 'みどりの風'),
          an_object_having_attributes(official_name: '生活の党'),
        ]
      }
      it { is_expected.to contain_exactly(*expectation) }
    end
  end
end
