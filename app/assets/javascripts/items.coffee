# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

  app = new Vue(
    el: "#items"
    data: items: []
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
            that.items = res
            return
          complete: ->
            that.$nextTick ->
              $('.thumbnail').matchHeight()
              return
            return
        )
        return

      image_path: (item) ->
        "/items/" + item.id + "/image"
  )


  return
