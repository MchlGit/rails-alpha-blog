// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// block hides that happen immediately after open (spurious blur)
document.addEventListener("shown.bs.dropdown", (e) => {
    const toggle = e.target.querySelector(".dropdown-toggle") || e.relatedTarget || e.target;
    toggle.__openedAt = performance.now();
});
document.addEventListener("hide.bs.dropdown", (e) => {
    const toggle = e.target.querySelector(".dropdown-toggle") || e.relatedTarget || e.target;
    const openedAt = toggle.__openedAt || 0;
    if (performance.now() - openedAt < 150) {
        // too soon; ignore this hide
        e.preventDefault();
        // optional: console.log("[NAV] prevented premature hide");
    }
});