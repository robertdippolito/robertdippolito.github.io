<template>
  <div id="app">
    <navbarView />
    <router-view></router-view>
    <myFooter />
  </div>
</template>

<script>
import navbarView from './components/navbarView.vue'
import mainHero from './components/mainHero.vue'
import myFooter from './components/myFooter.vue'
import ReadingList from './components/ReadingList.vue'
import ReadingListEntry from './components/ReadingListEntry.vue'

export default {
  name: 'App',
  components: {
    navbarView,
    mainHero,
    myFooter,
    ReadingList,
    ReadingListEntry
  }
}
</script>
