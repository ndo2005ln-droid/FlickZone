// External JavaScript File for FlickZone

// Utility Functions
function showMessage(elementId, message, isError = false) {
    const element = document.getElementById(elementId);
    if (element) {
        element.textContent = message;
        element.style.color = isError ? '#ff4444' : '#e50914';
        setTimeout(() => {
            element.textContent = '';
        }, 3000);
    }
}

// Form Validation Helper
function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

// Check if field is empty
function isEmpty(value) {
    return !value || value.trim() === '';
}

// Movie Rating Helper
function generateStars(rating) {
    let stars = "";
    for (let i = 1; i <= 5; i++) {
        stars += i <= rating ? "★" : "☆";
    }
    return stars;
}

// Date Formatter
function formatDate(date) {
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    return date.toLocaleDateString('en-US', options);
}

// LocalStorage Helpers
function saveToLocalStorage(key, value) {
    try {
        localStorage.setItem(key, JSON.stringify(value));
        return true;
    } catch (e) {
        console.error('Error saving to localStorage:', e);
        return false;
    }
}

function getFromLocalStorage(key) {
    try {
        const item = localStorage.getItem(key);
        return item ? JSON.parse(item) : null;
    } catch (e) {
        console.error('Error reading from localStorage:', e);
        return null;
    }
}

// Navigation Helper
function navigateTo(url) {
    window.location.href = url;
}

// Check Authentication
function isAuthenticated() {
    return localStorage.getItem("user") !== null;
}

// Logout Function
function logout() {
    localStorage.removeItem("user");
    localStorage.removeItem("pass");
    navigateTo("start.html");
}