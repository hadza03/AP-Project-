// userService.js
export async function registerUser(userData) {
  const res = await fetch("http://localhost/AUDIOPROJEKT/backend/auth/register", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(userData),
  });

  if (!res.ok) {
    const err = await res.json();
    throw new Error(err.message || "Registration failed");
  }

  return await res.json();
}

export async function loginUser(credentials) {
  const res = await fetch("http://localhost/AUDIOPROJEKT/backend/auth/login", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(credentials),
  });

  if (!res.ok) {
    const err = await res.json();
    throw new Error(err.message || "Login failed");
  }

  return await res.json();
}
