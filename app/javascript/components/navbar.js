const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const text = document.querySelectorAll('.nav-link');
  console.log(text);
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 485) {
        navbar.classList.add('navbar-lewagon-white');
        text.forEach((word)=> {
          word.classList.add('nav-link-blue');
        });
      } else {
        navbar.classList.remove('navbar-lewagon-white');
        text.forEach((word)=> {
          word.classList.remove('nav-link-blue');
        });
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
