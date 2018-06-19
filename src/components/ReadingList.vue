<template>
  <section class="hero">
    <div class="hero-body">
      <router-link to="/">
        <a class="button">
          <span class="icon is-medium"><i class="fab fa fa-chevron-left"></i></span>
          <b>Back</b>
        </a>
      </router-link>
    </div>
    <ReadingListEntry v-for="entry in storeState.readingListData" :entry="entry"/>
  </section>
</template>

<script>
import { store } from '../store.js'
import ReadingListEntry from './ReadingListEntry.vue'

export default {
  name: 'ReadingList',
  data () {
    return {
      storeState: store.state
    }
  },
  components: {
    ReadingListEntry
  },
  created () {
    console.log(store.state.readingListData)
  }
}
</script>
