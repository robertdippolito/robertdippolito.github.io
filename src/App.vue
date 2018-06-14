<template>
  <div id="app">
    <navbarView />
    <mainHero />
    <myFooter />
  </div>
</template>

<script>
import navbarView from './components/navbarView.vue'
import mainHero from './components/mainHero.vue'
import myFooter from './components/myFooter.vue'

export default {
  name: 'App',
  components: {
    navbarView,
    mainHero,
    myFooter
  }
}
</script>
