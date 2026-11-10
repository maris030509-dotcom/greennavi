document.addEventListener("turbo:load", () => {
  const assets = document.getElementById("how-to-assets");
  
  const data = [
    {
      image: assets.dataset.search,
      title: "公園を検索",
      description: "気になる公園をみつけよう"
    },
    {
      image: assets.dataset.check,
      title: "写真や設備をチェック",
      description: "写真や口コミから公園の雰囲気を知ろう"
    },
    {
      image: assets.dataset.community,
      title: "コミュニティで情報交換",
      description: "利用者同士で情報を共有しよう"
    }
  ];

  let current = 0;

  const image = document.getElementById("how-to-image");
  const title = document.getElementById("how-to-title");
  const description = document.getElementById("how-to-description")
  const dots = document.querySelectorAll(".step-dot");

  function updateCard() {
    image.src = data[current].image;
    title.textContent = data[current].title;
    description.textContent = data[current].description;

    dots.forEach((dot) => {
      dot.classList.remove("active");
    });
  
      dots[current].classList.add("active");
  }

  document.getElementById("next-btn").addEventListener("click", () => {
    current = (current + 1) % data.length;
    updateCard();
  });

  document.getElementById("prev-btn").addEventListener("click", () => {
    current = (current - 1 + data.length) % data.length;
    updateCard();
  });

});
