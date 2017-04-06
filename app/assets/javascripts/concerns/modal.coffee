Vue.component "modal-content", {
  props: ["show_item"]
  data: ->
    return {
      success_message: ""
      error_message: ""
    }
  methods:
    update: (item) ->
      stock = item.stock
      item.stock = item.stock - $("#order").val()
      that = this
      $.ajax(
        type: "PUT"
        data: item: item
        url: "/items/" + item.id + ".json"
        success: (res) ->
          that.success_message = res["message"]
          return
        error: (res) ->
          that.error_message = JSON.parse(res.responseText)["stock"][0]
          item.stock = stock
          return
      )
      return

  template:
    """
    <div class="modal-content" v-if="show_item != null">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="detailLabel"><span class="label label-primary">{{show_item.category}}</span>  {{show_item.name}}</h4>
      </div>
      <div class="modal-body">

        <div class="alert alert-success" role="alert" v-if="success_message !== ''">
          <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>
          <p>{{success_message}}</p>
        </div>
        <div class="alert alert-danger" role="alert" v-if="error_message !== ''">
          <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>
          <p>{{error_message}}</p>
        </div>
        
        <img v-bind:src="$parent.image_path(show_item)" class="img-responsive">
        <h4 class="text-right">¥{{show_item.price}}</h4>
        <p>{{show_item.description}}</p>
        
        <h4 class="stock" v-if="show_item.stock > 0"><span class="label label-success">{{show_item.stock}}個</span></h4>
        <h4 class="stock" v-else><span class="label label-danger">売り切れ</span></h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <form class="form-inline pull-left">
          <div class="input-group">
            <input id="order" type="number" class="form-control" min="0" v-bind:max="show_item.stock" value="0">
            <div class="input-group-addon">個</div>
          </div>
          <button type="button" class="btn btn-primary" v-bind:disabled="show_item.stock == 0" v-on:click="update(show_item)" onsubmit="return false;">ポチる</button>
        </div>
      </div>
    </div>
    """
}
