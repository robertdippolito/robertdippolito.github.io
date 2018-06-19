<template>
  <div class="hero-body">
    <div class="columns">
      <div class="column is-one-third">
        <div class="tile is-parent">
          <article class="tile is-child" style="justify-content:center;">
            <figure style="text-align:center;">
              <img v-bind:src="entry.imageURL" style="width:50%;height:50%; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
            </figure>
          </article>
        </div>
      </div>
      <div class="column is-two-thirds">
        <div class="content">
          <h1 class="title">{{ entry.title }}</h1>
          <h2 class="subtitle is-size-4">{{ entry.author }}</h2>
          <p>{{ entry.body }}</p>
        </div>
      </div>
      </div>
      <hr/>
    </div>
</template>

<script>

export default {
  name: 'ReadingListEntry',
  props: ['entry']
}
</script>
