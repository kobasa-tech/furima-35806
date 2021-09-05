document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('item-image')){
    const ImageList = document.getElementById('image-list');

    //生成した画像を表示する関数
    const createImageHTML = (blob) => {
      //画像を表示するための要素を生成
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);

      //生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    }

    //画像を取得してURLを生成
    document.getElementById('item-image').addEventListener('change', (e) => {
      const imageContent = document.querySelector('.click-upload img');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});
