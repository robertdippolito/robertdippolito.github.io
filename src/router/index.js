import Vue from 'vue'
import Router from 'vue-router'
import ReadingList from '@/components/ReadingList.vue'
import mainHero from '@/components/mainHero.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'mainHero',
      component: mainHero
    },
    {
      path: '/readinglist',
      name: 'ReadingList',
      component: ReadingList
    }
  ]
})
