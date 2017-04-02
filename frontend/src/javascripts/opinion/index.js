import Vue from 'vue'
import OpinionComponent from '../components/Opinion'

new Vue({
  el: '#vue-footer-opinion',
  template: "<opinion-component></opinion-component>",
  components: { 'opinion-component': OpinionComponent },
})
