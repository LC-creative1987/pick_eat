const fruitAnimations = () => {
  const getRandom = (min, max) => Math.floor(Math.random() * (max - min + 1) + min);
  // Select the veggie

  const fruits = document.querySelectorAll(".fruit")
  // Change the position of the veggie, randomly
  fruits.forEach((fruit) => {
    // Change the position of the veggie, randomly
    let fruitX = 15;
    let fruitY = 30;
    fruit.style.right = `${fruitX}%`;
    fruit.style.bottom = `${fruitY}%`;
    setInterval(() => {

      fruitX = getRandom(15, 30);
      fruitY = getRandom(30, 70);

      fruit.style.right = `${fruitX}%`;
      fruit.style.bottom = `${fruitY}%`;
    }, 2000)

  })
}

export { fruitAnimations };
