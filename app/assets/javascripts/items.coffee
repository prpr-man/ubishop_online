# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

  app = new Vue(
    el: "#shop"
    data: 
      items: []
      categories: []
      show_item: null
    created: ->
      this.fetch()
      return
    updated: ->
      images = $('.thumbnail img')
      images[images.length-1].onload = ->
        $('.thumbnail').matchHeight()
        return
      return
    methods:
      fetch: ->
        that = this
        $.ajax(
          type: 'GET'
          url: '/items.json'
          success: (res) ->
            that.items = JSON.parse(res['items'])
            that.categories = JSON.parse(res['categories'])
            return
        )
        return
      
      show: (item) ->
        this.show_item = item
        return

      image_path: (item) ->
        "/items/" + item.id + "/image"

      update: (item) ->
        item.stock = item.stock - $('#order').val()
        that = this
        $.ajax(
          type: 'PUT'
          data: item: item
          url: '/items/' + item.id + '.json'
          success: (res) ->
            console.log('ok')
            return
          error: (res) ->
            console.log('error')
            return
        )
        return





  )

  return
