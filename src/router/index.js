import Vue from 'vue'
import Router from 'vue-router'
import ReadingList from '@/components/ReadingList.vue'
import mainHero from '@/components/mainHero.vue'
import experience from '@/components/experience.vue'
import workView from '@/components/work.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
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
    },
    {
      path: '/experience',
      name: 'experience',
      component: experience
    },
    {
      path: '/work',
      name: 'workView',
      component: workView
    }
  ]
})
