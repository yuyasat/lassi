import Vue from 'vue'

export default Vue.extend({
  template: `
    <form>
      <textarea v-model="opinionText" v-if="!sent"></textarea>
      <div class="a__submit-thanks" v-if="sent">
        <div class="a__caption">ご意見は送信されました</div>
        <div class="a__description">
          いただいた意見は<br>必ずスタッフが目を通します。<br>
          サービス改善のための<br>参考にさせていただきます。
        </div>
      </div>
      <div class="mol__submit-wraper">
        <input
          v-on:click="submitOpinion"
          class="a__button-basic"
          value="運営者にご意見を送る">
      </div>
    </form>
  `,
  data: function () {
    return {
      sent: false,
      opinionText: ''
    }
  },
  methods: {
    submitOpinion: function (e) {
      // ここにrails側にpostする処理を書く
      this.sent = true
      return e.preventDefault()
    }
  }
})
