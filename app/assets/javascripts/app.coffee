$(document).on "ready page:load", ->
  app = new Vue({
    el: "#app"
    data: 
      all_items: []
      items: []
      categories: []
      show_item: null

    created: ->
      this.fetch()
      return

    methods:
      fetch: ->
        that = this
        $.ajax(
          type: 'GET'
          url: '/items.json'
          success: (res) ->
            that.all_items = that.items = JSON.parse(res['items'])
            that.categories = JSON.parse(res['categories'])
            return
        )
        return

      image_path: (item) ->
        "/items/" + item.id + "/image"

      filter: (category) ->
        this.items = if category is null then this.all_items else $.grep(this.all_items, (element, index) ->　element.category is category)
        return

      show: (item) ->
        this.show_item = item
        return
  })

  return
