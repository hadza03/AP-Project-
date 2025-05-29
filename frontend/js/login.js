document.getElementById("login-form").addEventListener("submit", async function (e) {
  e.preventDefault();

  const email = document.querySelector("input[type=email]").value;
  const password = document.querySelector("input[type=password]").value;

  try {
    const res = await fetch("http://localhost/AUDIOPROJEKT/backend/auth/login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email, password })
    });

    const data = await res.json();

    if (!res.ok) throw new Error(data.error || "Login failed");

    // Save token and user info
    localStorage.setItem("token", data.data.token);
    localStorage.setItem("user", JSON.stringify(data.data));

    // Load home page
    loadPage("home");

  } catch (err) {
    alert(err.message);
  }
});
