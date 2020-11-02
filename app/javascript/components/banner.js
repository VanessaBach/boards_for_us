import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["The board that fits to you"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
