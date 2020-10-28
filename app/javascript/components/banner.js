import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["The best experience"],
    typeSpeed: 60,
    loop: true
  });
}

export { loadDynamicBannerText };