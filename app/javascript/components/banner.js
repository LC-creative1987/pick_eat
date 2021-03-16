import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const textBox = document.querySelector('#banner-typed-text');

  if (textBox) {
    new Typed('#banner-typed-text', {
      strings: ["IT'S FUN TO BE A PICKY EATER"],
      typeSpeed: 200,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
