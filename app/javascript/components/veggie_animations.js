const veggieAnimations = () => {
  console.log('veggie')
  // Select the veggie
  const veggie = document.querySelector(".vegetable")
  // Change the position of the veggie, randomly
  let veggieX = 0;
  let veggieY = 0;

  setInterval(() => {
    console.log(veggie);
    veggieX += Math.random() * 100
    // veggieY += Math.random() * 100

    veggie.style.bottom = `${veggieX}px`;
    veggie.style.left = `${veggieY}px`;
  }, 2000)
}

export { veggieAnimations };
