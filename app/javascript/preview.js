$(function(){
  $('#image-attached').on('change', function(e){

    let files = e.target.files;
    $.each(files, function(index, file){
      let reader = new FileReader();

      // 画像でない場合は処理終了
      if(file.type.indexOf("image") < 0){
        alert("画像ファイルを指定してください。");
        return false;
      }

      reader.onload = (function(file){
        return function(e){
          let imageLength = $('#preview').children('li').length;                 // 表示されているプレビューの数を数える
          let labelLength = $("#image-input>label").eq(-1).data('label-id');  // labelの中から最後の要素のカスタムデータidを取得

          // プレビュー表示
          $('#preview').append(`<li class="preview-image-list" id="preview-image${labelLength}" data-image-id="${labelLength}">
                                  <img src='${e.target.result}' class='preview-image' title='${file.name}' >
                                </li>`);
          $('#no-preview').remove();

          // 最大3枚まで投稿可能とする
          if (imageLength < 2) {
            $("#image-input").append(`<label for="post-images${labelLength+1}" class="images-label" data-label-id="${labelLength+1}">
                                        <input class="post-images" id="post-images${labelLength+1}" type="file" name="post[images][]">
                                      </label>`);
          };
        };
      })(file);
      reader.readAsDataURL(file);
    });
  });
});






// document.addEventListener('DOMContentLoaded', function(){
//   if ( document.getElementById('post-images')){
//     const Preview = document.getElementById('preview');
//     // 選択した画像のプレビューを表示
//     const createPreviewHTML = (blob) => {
//       const imageElement = document.createElement('div');
//       imageElement.setAttribute('class', 'image-element')
//       let imageElementNum = document.querySelectorAll('.image-element').length

//       const blobImage = document.createElement('img');
//       blobImage.setAttribute('class', 'preview-image')
//       blobImage.setAttribute('src', blob);

//       const inputHTML = document.createElement('input');
//       inputHTML.setAttribute('class', 'image-form-lower')
//       inputHTML.setAttribute('id', `post-images-${imageElementNum}`)
//       inputHTML.setAttribute('name', 'post[images][]')
//       inputHTML.setAttribute('type', 'file')

//       imageElement.appendChild(blobImage);
//       Preview.appendChild(imageElement);

//       document.getElementById('image-attached').appendChild(inputHTML);
//       inputHTML.addEventListener('change', (e) => {
//         file = e.target.files[0];
//         blob = window.URL.createObjectURL(file);

//         createPreviewHTML(blob)
//       });
//     };
//     // //選択した画像のプレビューを表示

//     document.getElementById('post-images').addEventListener('change', function(e){
//       const imageContent = document.getElementById('no-preview');
//       imageContent.remove();

//       let file = e.target.files[0];
//       let blob = window.URL.createObjectURL(file);

//       createPreviewHTML(blob)
//     });
//   }
// });