document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('item-image')){
    const ImageList = document.getElementById('image-list');

    //生成した画像を表示する関数
    const createImageHTML = (blob) => {
      //画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length;

      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);

      // ファイル選択ボタンを生成
      const inputHTML = document.createElement('input');
      inputHTML.setAttribute('id', `item-image-${ imageElementNum }`);
      inputHTML.setAttribute('name', 'item[images][]');
      inputHTML.setAttribute('type', 'file');

      //生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      imageElement.appendChild(inputHTML);
      ImageList.appendChild(imageElement);

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob);
      });
    };

    //画像を取得してURLを生成
    document.getElementById('item-image').addEventListener('change', (e) => {

      // 1枚投稿時のプレビュー枚数制限
      // const imageContent = document.querySelector('.click-upload img');
      // if (imageContent){
      //   imageContent.remove();
      // }
      // 1枚投稿時のプレビュー枚数制限

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});
