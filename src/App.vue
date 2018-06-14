<template>
  <div id="app">
    <navbarView />
    <mainHero />
  </div>
</template>

<script>
import navbarView from './components/navbarView.vue'
import mainHero from './components/mainHero.vue'

export default {
  name: 'App',
  components: {
    navbarView,
    mainHero
  }
}
</script>
