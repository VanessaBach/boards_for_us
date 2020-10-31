import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Surf is life"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
