export async function getAllProducts() {
  const res = await fetch("https://audio-backend-7csf7.ondigitalocean.app/AUDIOPROJEKT/backend/products");

  if (!res.ok) {
    throw new Error("Failed to fetch products");
  }

  return await res.json();
}

export async function getProductById(id) {
  const res = await fetch(`https://audio-backend-7csf7.ondigitalocean.app/AUDIOPROJEKT/backend/products/${id}`);
  if (!res.ok) {
    throw new Error("Failed to fetch product details");
  }
  return await res.json();
}
