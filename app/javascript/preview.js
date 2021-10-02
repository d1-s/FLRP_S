document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('post-images')){
    const Preview = document.getElementById('preview');
    // 選択した画像のプレビューを表示
    const createPreviewHTML = (blob) => {
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', 'image-element')
      let imageElementNum = document.querySelectorAll('.image-element').length

      const blobImage = document.createElement('img');
      blobImage.setAttribute('class', 'preview-image')
      blobImage.setAttribute('src', blob);

      const inputHTML = document.createElement('input');
      inputHTML.setAttribute('class', 'image-form-lower')
      inputHTML.setAttribute('id', `post-images-${imageElementNum}`)
      inputHTML.setAttribute('name', 'post[images][]')
      inputHTML.setAttribute('type', 'file')

      imageElement.appendChild(blobImage);
      Preview.appendChild(imageElement);

      document.getElementById('image-attached').appendChild(inputHTML);
      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createPreviewHTML(blob)
      });
    };
    // //選択した画像のプレビューを表示

    document.getElementById('post-images').addEventListener('change', function(e){
      const imageContent = document.getElementById('no-preview');
      imageContent.remove();

      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

      createPreviewHTML(blob)
    });
  }
});