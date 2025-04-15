function searchPasswords() {
    let input = document.getElementById("searchInput").value.toLowerCase();
    let rows = document.querySelectorAll(".password-list tbody tr");
    rows.forEach(row => {
      let service = row.cells[0].textContent.toLowerCase();
      row.style.display = service.includes(input) ? "" : "none";
    });
  }
  
  // Optional: add DOMContentLoaded to ensure it works even if scripts are at top
  document.addEventListener("DOMContentLoaded", () => {
    const input = document.getElementById("searchInput");
    if (input) {
      input.addEventListener("keyup", searchPasswords);
    }
  });