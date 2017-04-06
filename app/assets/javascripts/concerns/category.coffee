Vue.component "category-list", {
  props: ["categories"]
  methods:
    filter: (category) ->
      this.$emit "filter", category
      return
  template:
    """
    <div class="list-group">
      <button type='button' class='list-group-item' v-on:click='filter(null)'>全て</button>\n
      <button type='button' class='list-group-item' v-for='category in categories' v-on:click='filter(category)'>{{category}}</button>
    <div>
    """
}
