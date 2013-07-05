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
    "" : "openAlbumForm"
  },
  
  openAlbumForm: function () {
    var that = this;
    var view = new FlickrClone.Views.PhotoAlbumForm({
      model: that.photo
    })
    this.$popup.html(view.render().$el);
  },
  
});
