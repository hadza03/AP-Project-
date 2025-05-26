document.getElementById("register-form").addEventListener("submit", function (e) {
  e.preventDefault();

  const username = document.getElementById("username").value.trim();
  const email = document.getElementById("email").value.trim();
  const password = document.getElementById("password").value;
  const confirmPassword = document.getElementById("confirm-password").value;

  if (password !== confirmPassword) {
    alert("Passwords do not match!");
    return;
  }

  fetch("http://localhost/AUDIOPROJEKT/backend/auth/register", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ username, email, password }),
  })
    .then((res) => {
      if (!res.ok) {
        return res.json().then(err => { throw new Error(err.message || "Registration failed"); });
      }
      return res.json();
    })
    .then((data) => {
      alert("Registration successful! Redirecting to login...");
      loadPage("login");
    })
    .catch((err) => {
      alert("Error: " + err.message);
    });
});
