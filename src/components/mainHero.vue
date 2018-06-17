<template>
  <section class="hero is-medium">
    <div class="hero-body">
      <div class="container">
        <h1 class="title has-text-black is-size-1 has-text-centered">
          <b>Hey! 👋 I'm Rob D'Ippolito</b>
        </h1>
        <h2 class="subtitle has-text-black is-size-4 has-text-centered" style="padding-top:20px;">
          Consultant at Accenture and Frontend/Mobile Developer
        </h2>
      </div>
      <div class="container" style="padding-top:40px;">
        <div class="buttons is-centered">
          <a class="button is-focused is-danger is-rounded is-large"><b>Resume</b></a>
          <div style="width:50px; height:auto; display:inline-block;"></div>
          <router-link to="/readinglist">
            <a class="button is-focused is-info is-rounded is-large">
              <b>Reading List</b>
              <span class="icon"><i class="fab fa fa-chevron-right"></i></span>
            </a>
          </router-link>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'mainHero'
}
</script>
