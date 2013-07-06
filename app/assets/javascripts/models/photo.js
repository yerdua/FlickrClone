FlickrClone.Models.Photo = Backbone.Model.extend({
  url: function () {
    return '/photos/' + this.id
  },
  // 
  // relations: [{
  //   type: Backbone.HasMany,
  //   key: 'albums',
  //   relatedModel: 'FlickrClone.Models.Album',
  //   collectionType: 'FlickrClone.Collections.AlbumCollection'
  // }]
});
