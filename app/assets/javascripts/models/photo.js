FlickrClone.Models.Photo = Backbone.Model.extend({
  url: function () {
    return '/photos/' + this.id
  },
});
