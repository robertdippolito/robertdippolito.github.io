<template>
  <nav class="level is-mobile" style="padding-top: 40px; padding-left:30%; padding-right:30%;">
    <div class="level-item has-text-centered">
      <div>
        <router-link to="/experience">
          <a class=navbar-item href="#"><p class="title is-size-5 has-text-grey has-text-weight-light">Experience</p></a>
        </router-link>
      </div>
    </div>
    <div class="level-item has-text-centered">
      <div>
        <router-link to="/work">
          <a class=navbar-item href="#"><p class="title is-size-5 has-text-grey has-text-weight-light">Work</p></a>
        </router-link>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'navbarView'
}
</script>
