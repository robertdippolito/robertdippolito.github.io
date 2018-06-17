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
    <ReadingListEntry />
  </section>
</template>

<script>
import ReadingListEntry from './ReadingListEntry.vue'

export default {
  name: 'ReadingList',
  components: {
    ReadingListEntry
  }
}
</script>
