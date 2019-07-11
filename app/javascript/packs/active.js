const search = document.querySelector('.search');

search.addEventListener('focus', (event) => {
    event.currentTarget.classList.toggle("active");
});