import Vue from 'vue'
import axios from 'axios'
import $ from 'jquery'

const sentContent = `
  <div class="a__submit-thanks a__plate" v-if="sent && !errorFlag">
    <div class="a__caption">ご意見は送信されました</div>
    <div class="a__description">
      いただいた意見は<br>必ずスタッフが目を通します。<br>
      サービス改善のための<br>参考にさせていただきます。
    </div>
  </div>
`
const errorContent = `
  <div class="a__submit-thanks" v-if="errorFlag">
    <div class="a__caption">エラーが発生しました。</div>
    <div class="a__description">
      申し訳ありません。<br>しばらく時間をおいて再度お試しください。
    </div>
  </div>
`

export default Vue.extend({
  template: `
    <form>
      <textarea v-model="opinionText" v-if="!sent" class="a__plate"></textarea>
      ${sentContent}
      ${errorContent}
      <div class="mol__submit-wraper">
        <input type="button"
          v-on:click="submitOpinion"
          class="a__button-basic"
          value="運営者にご意見を送る">
      </div>
    </form>
  `,
  data: function () {
    return {
      sent: false,
      errorFlag: false,
      opinionText: ''
    }
  },
  methods: {
    submitOpinion: function (e) {
      if (this.opinionText === '') { return }
      // TODO: Refactoring
      const data = {
        opinion: { content: this.opinionText }
      }
      axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content')
      axios.post('/private/api/v1/opinions', data)
        .then((response) => {
          this.sent = true
          this.opinionText = ''
          return e.preventDefault()
        })
        .catch((error) => {
          // TODO: Error Handling
          this.errorFlag = this.sent = true
          console.log(error)
        })
    }
  }
})
