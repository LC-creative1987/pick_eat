import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["WELCOME TO PICK EAT"],
    typeSpeed: 200,
    loop: true
  });
}

export { loadDynamicBannerText };
