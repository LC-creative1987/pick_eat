const fruitAnimations = () => {
  console.log('fruit')
  // Select the veggie
  const fruit = document.querySelector(".fruit")
  // Change the position of the veggie, randomly
  let fruitX = 0;
  let fruitY = 0;

  setInterval(() => {
    console.log(fruit);
    // fruitX += Math.random() * 100
    fruitY += Math.random() * 50

    // fruit.style.bottom = `${fruitX}px`;
    fruit.style.right = `${fruitY}px`;
  }, 1500)
}

export { fruitAnimations };
