Vue.component "item-list", {
  props: [ "items" ]
  updated: ->
    images = $(".thumbnail img")
    images[images.length-1].onload = ->
      $(".thumbnail").matchHeight()
      return
    return
  methods:
    show: (item) ->
      this.$emit "show", item
      return

  template:
    """
    <div>
    <div class='item col-sm-4 col-lg-4 col-md-4' v-for='(item, index) in items'>
      <div class='thumbnail'>
        <img v-bind:src='$parent.image_path(item)'>
        <div class='caption'>
          <h4 class='pull-right'>¥{{item.price}}</h4>
          <h4><a href='#detail' role='button' data-toggle='modal' data-target='#detail' v-on:click='show(item)'>{{item.name}}</a></h4>
          <h4 class='stock' v-if='item.stock > 0'><span class='label label-success'>{{item.stock}}個</span></h4>
          <h4 class='stock' v-else><span class='label label-danger'>売り切れ</span></h4>
        </div>
      </div>
    </div>
    </div>
    """
}
