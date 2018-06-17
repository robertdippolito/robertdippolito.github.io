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
    <div class="hero-body">
      <div class="columns is-8">
        <div class="column">
          First column
        </div>
        <div class="column">
          <div class="content">
            <h1>Hello World</h1>
            <p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'ReadingList'
}
</script>
