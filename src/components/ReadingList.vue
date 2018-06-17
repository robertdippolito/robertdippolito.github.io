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
      <div class="columns">
        <div class="column is-one-third">
          <div class="tile is-parent">
            <article class="tile is-child" style="justify-content:center;">
              <figure style="text-align:center;">
                <img src="https://i.imgur.com/F7kY1LV.jpg" style="width:50%;height:50%;">
              </figure>
            </article>
          </div>
        </div>
        <div class="column is-two-thirds">
          <div class="content">
            <h1 class="title">Lean In</h1>
            <h2 class="subtitle is-size-4">Sheryl Sandberg</h2>
            <p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
          </div>
        </div>
      </div>
      <hr/>
    </div>
  </section>
</template>

<script>
export default {
  name: 'ReadingList'
}
</script>
