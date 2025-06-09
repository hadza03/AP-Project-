import { registerUser } from "./services/userService.js";

document.getElementById("register-form").addEventListener("submit", async function (e) {
  e.preventDefault();

  // Dohvatanje vrijednosti
  const username = document.getElementById("username").value.trim();
  const email = document.getElementById("email").value.trim();
  const password = document.getElementById("password").value;
  const confirmPassword = document.getElementById("confirm-password").value;

  // Reset poruka
  document.querySelectorAll(".error").forEach(el => el.innerText = "");

  let isValid = true;

  // Validacija: username
  if (username.length < 3) {
    document.getElementById("username-error").innerText = "Username must be at least 3 characters.";
    isValid = false;
  }

  // Validacija: email
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    document.getElementById("email-error").innerText = "Please enter a valid email address.";
    isValid = false;
  }

  // Validacija: password
  if (password.length < 6) {
    document.getElementById("password-error").innerText = "Password must be at least 6 characters.";
    isValid = false;
  }

  // Validacija: potvrda lozinke
  if (password !== confirmPassword) {
    document.getElementById("confirm-password-error").innerText = "Passwords do not match.";
    isValid = false;
  }

  // Ako ima grešaka, prekini slanje
  if (!isValid) return;

  //* Slanje na server
  try {
    await registerUser({ username, email, password });
    alert("Registration successful! Redirecting to login...");
    loadPage("login");
  } catch (err) {
    // Ako backend vrati grešku
    alert("Error: " + err.message);
  }
});
