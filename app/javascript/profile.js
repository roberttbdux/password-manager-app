function enableEdit() {
    document.getElementById("nameField").disabled = false;
    document.getElementById("emailField").disabled = false;
  
    const currentPassword = document.getElementById("currentPasswordField");
    currentPassword.disabled = false;
    currentPassword.value = "";
    currentPassword.name = "user[current_password]";
    currentPassword.type = "password";
  
    document.getElementById("newPasswordWrapper").classList.remove("d-none");
  
    document.getElementById("editBtn").classList.add("d-none");
    document.getElementById("saveBtn").classList.remove("d-none");
    document.getElementById("cancelBtn").classList.remove("d-none");
  }
  
  function cancelEdit() {
    document.getElementById("nameField").disabled = true;
    document.getElementById("emailField").disabled = true;
  
    const currentPassword = document.getElementById("currentPasswordField");
    currentPassword.disabled = true;
    currentPassword.value = "********";
    currentPassword.removeAttribute("name");
    currentPassword.type = "password";
  
    document.getElementById("newPasswordWrapper").classList.add("d-none");
    document.getElementById("newPasswordField").value = "";
  
    document.getElementById("editBtn").classList.remove("d-none");
    document.getElementById("saveBtn").classList.add("d-none");
    document.getElementById("cancelBtn").classList.add("d-none");
  }
  
  function togglePasswordVisibility(fieldId, buttonEl) {
    const field = document.getElementById(fieldId);
    field.type = field.type === "password" ? "text" : "password";
  }
  
  function searchPasswords() {
    let input = document.getElementById("searchInput").value.toLowerCase();
    let rows = document.querySelectorAll(".password-list tbody tr");
    rows.forEach(row => {
      let service = row.cells[0].textContent.toLowerCase();
      row.style.display = service.includes(input) ? "" : "none";
    });
  }