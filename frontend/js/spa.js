function loadPage(page) {
    fetch(`frontend/views/${page}.html`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`Page not found: ${page}`);
            }
            return response.text();
        })
        .then(html => {
            document.getElementById("content").innerHTML = html;

            // Manage body classes based on page
            document.body.className = ""; // Reset any previous class

            if (page === "login" || page === "register") {
                document.body.classList.add("auth-page"); // Apply class for login/register
            } else {
                document.body.classList.add("main-page"); // Apply for other pages
            }
        })
        .catch(error => {
            console.error("Error loading page:", error);
            document.getElementById("content").innerHTML = "<h2>Page not found.</h2>";
        });
}
// Load the correct page on refresh
window.onload = function () {
    let page = window.location.hash.substring(1); // Get hash from URL
    if (!page) {
        page = "home"; // Default to home page
    }
    loadPage(page);
};
