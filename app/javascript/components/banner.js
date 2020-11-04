import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["The board that fits you"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
