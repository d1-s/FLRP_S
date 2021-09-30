document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('post_image')){
    const Preview = document.getElementById('preview');
    // 選択した画像のプレビューを表示
    const createPreviewHTML = (blob) => {
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.className = 'preview-image'
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
      Preview.appendChild(imageElement);
    };
    // //選択した画像のプレビューを表示

    document.getElementById('post_image').addEventListener('change', function(e){
      const imageContent = document.querySelector('.preview-image');
      imageContent.remove();

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createPreviewHTML(blob)
    });
  }
});