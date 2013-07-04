FlickrClone.Routers.Photos = Backbone.Router.extend({
  initialize: function ($rootEl, $popup, photoId) {
    this.$rootEl = $rootEl;
    this.$popup = $popup;
    this.photo = new FlickrClone.Models.Photo({ id: photoId });
    this.photo.fetch({
      success: function() {
        console.log('fetched a thing');
      }
    });
  },
  
  routes: {
    "addToAlbums" : "addToAlbums"
  },
  
  addToAlbums: function () {
    console.log('does things at all');
    var that = this;
    console.log("add to albums was called");
    var view = new FlickrClone.Views.PhotoAddToAlbums({
      model: that.photo
    })
    this.$popup.html(view.render().$el);
  },
  
});
