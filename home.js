// School Tour Data
const schoolAreas = [
    {
        id: 1,
        name: "Main Hall",
        image: "https://images.unsplash.com/photo-1571260899304-425eee4c7efc?w=800&h=600&fit=crop",
        description: "Our grand main hall hosts assemblies, performances, and special events with state-of-the-art acoustics.",
        features: ["500+ Capacity", "Modern Audio/Visual", "Air Conditioned"],
        color: "linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%)",
        capacity: "500 students",
        established: "2018",
        rating: 4.9,
        virtualTour: true,
        highlights: ["Weekly assemblies", "Cultural programs", "Guest lectures"]
    },
    {
        id: 2,
        name: "Library",
        image: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=800&h=600&fit=crop",
        description: "A quiet sanctuary of knowledge with over 10,000 books, digital resources, and comfortable study spaces.",
        features: ["10,000+ Books", "Digital Resources", "Study Zones"],
        color: "linear-gradient(135deg, #10b981 0%, #06b6d4 100%)",
        capacity: "200 students",
        established: "2015",
        rating: 4.8,
        virtualTour: true,
        highlights: ["Silent study zones", "Digital catalog", "Research assistance"]
    },
    {
        id: 3,
        name: "Canteen",
        image: "https://images.unsplash.com/photo-1567521464027-f127ff144326?w=800&h=600&fit=crop",
        description: "Fresh, healthy meals served daily in our modern dining facility with diverse menu options.",
        features: ["Healthy Meals", "Multiple Cuisines", "Fresh Daily"],
        color: "linear-gradient(135deg, #f97316 0%, #ef4444 100%)",
        capacity: "300 students",
        established: "2019",
        rating: 4.7,
        virtualTour: false,
        highlights: ["Nutritious meals", "Hygienic environment", "Student favorites"]
    },
    {
        id: 4,
        name: "Science Laboratory",
        image: "https://images.unsplash.com/photo-1576086213369-97a306d36557?w=800&h=600&fit=crop",
        description: "Fully equipped labs for physics, chemistry, and biology with modern instruments and safety features.",
        features: ["Modern Equipment", "Safety First", "Hands-on Learning"],
        color: "linear-gradient(135deg, #06b6d4 0%, #3b82f6 100%)",
        capacity: "30 students",
        established: "2020",
        rating: 4.9,
        virtualTour: true,
        highlights: ["Latest equipment", "Safety protocols", "Expert guidance"]
    },
    {
        id: 5,
        name: "Sports Complex",
        image: "https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800&h=600&fit=crop",
        description: "Indoor gymnasium and outdoor courts for various sports activities and physical education.",
        features: ["Multi-sport Courts", "Modern Gym", "Professional Coaching"],
        color: "linear-gradient(135deg, #22c55e 0%, #10b981 100%)",
        capacity: "100 students",
        established: "2017",
        rating: 4.8,
        virtualTour: true,
        highlights: ["Professional coaching", "Multiple sports", "Fitness center"]
    },
    {
        id: 6,
        name: "Computer Lab",
        image: "https://images.unsplash.com/photo-1559028006-448665bd7c7f?w=800&h=600&fit=crop",
        description: "High-tech computer laboratory with latest software and high-speed internet for digital learning.",
        features: ["Latest Software", "High-speed Internet", "1:1 Computing"],
        color: "linear-gradient(135deg, #8b5cf6 0%, #ec4899 100%)",
        capacity: "40 students",
        established: "2021",
        rating: 4.9,
        virtualTour: true,
        highlights: ["1:1 computing", "Latest software", "High-speed internet"]
    },
    {
        id: 7,
        name: "Art Studio",
        image: "https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800&h=600&fit=crop",
        description: "Creative space equipped with easels, art supplies, and natural light for artistic expression.",
        features: ["Natural Light", "Art Supplies", "Creative Space"],
        color: "linear-gradient(135deg, #ec4899 0%, #f43f5e 100%)",
        capacity: "25 students",
        established: "2019",
        rating: 4.7,
        virtualTour: false,
        highlights: ["Natural lighting", "Art exhibitions", "Creative workshops"]
    },
    {
        id: 8,
        name: "Music Room",
        image: "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800&h=600&fit=crop",
        description: "Soundproofed music room with various instruments and recording equipment for musical education.",
        features: ["Various Instruments", "Recording Studio", "Soundproofed"],
        color: "linear-gradient(135deg, #8b5cf6 0%, #a855f7 100%)",
        capacity: "20 students",
        established: "2020",
        rating: 4.8,
        virtualTour: true,
        highlights: ["Recording studio", "Live performances", "Music theory"]
    },
    {
        id: 9,
        name: "Playground",
        image: "https://images.unsplash.com/photo-1551698618-1dfe5d97d256?w=800&h=600&fit=crop",
        description: "Safe outdoor playground with modern equipment for recreation and physical development.",
        features: ["Safe Equipment", "Outdoor Fun", "Age Appropriate"],
        color: "linear-gradient(135deg, #eab308 0%, #f97316 100%)",
        capacity: "150 students",
        established: "2016",
        rating: 4.6,
        virtualTour: false,
        highlights: ["Safety first", "Age-appropriate", "Supervised play"]
    }
];

// Global Variables
let currentSlide = 0;
let isAutoPlaying = true;
let viewMode = 'carousel';
let likedItems = new Set();
let visitCount = 1247;
let particles = [];
let autoPlayInterval;

// DOM Elements
const carouselView = document.getElementById('carousel-view');
const gridView = document.getElementById('grid-view');
const listView = document.getElementById('list-view');
const carouselSlides = document.getElementById('carousel-slides');
const thumbnailNav = document.getElementById('thumbnail-nav');
const progressFill = document.getElementById('progress-fill');
const prevBtn = document.getElementById('prev-btn');
const nextBtn = document.getElementById('next-btn');
const playPauseBtn = document.getElementById('play-pause-btn');
const muteBtn = document.getElementById('mute-btn');
const fullscreenBtn = document.getElementById('fullscreen-btn');
const viewBtns = document.querySelectorAll('.view-btn');
const shareBtn = document.getElementById('share-btn');
const bookVisitBtn = document.getElementById('book-visit-btn');
const bookingModal = document.getElementById('booking-modal');
const cancelBookingBtn = document.getElementById('cancel-booking');
const bookingForm = document.getElementById('booking-form');
const viewCountElement = document.getElementById('view-count');
const likeCountElement = document.getElementById('like-count');

// Initialize Application
document.addEventListener('DOMContentLoaded', function() {
    initializeParticles();
    initializeCarousel();
    initializeEventListeners();
    startAutoPlay();
    updateStats();
});

// Particle System
function initializeParticles() {
    const particlesContainer = document.getElementById('particles-container');
    
    for (let i = 0; i < 15; i++) {
        const particle = document.createElement('div');
        particle.className = 'particle';
        particle.style.left = Math.random() * 100 + '%';
        particle.style.top = Math.random() * 100 + '%';
        particle.style.animationDelay = Math.random() * 6 + 's';
        particle.style.animationDuration = (Math.random() * 3 + 3) + 's';
        particlesContainer.appendChild(particle);
    }
}

// Carousel Functions
function initializeCarousel() {
    renderCarouselSlides();
    renderThumbnails();
    updateProgressBar();
}

function renderCarouselSlides() {
    carouselSlides.innerHTML = '';
    
    schoolAreas.forEach((area, index) => {
        const slide = document.createElement('div');
        slide.className = `slide ${index === currentSlide ? 'active' : ''}`;
        
        slide.innerHTML = `
            <img src="${area.image}" alt="${area.name}" class="slide-image">
            <div class="slide-overlay" style="background: ${area.color}"></div>
            <div class="slide-content">
                <div class="slide-inner">
                    <div class="slide-badge">
                        ${area.virtualTour ? '360° Virtual Tour Available' : 'Photo Gallery'}
                    </div>
                    <h2 class="slide-title">${area.name}</h2>
                    <p class="slide-description">${area.description}</p>
                    
                    <div class="interactive-stats">
                        <div class="stat-box">
                            <i class="fas fa-users"></i>
                            <div class="stat-value">${area.capacity}</div>
                        </div>
                        <div class="stat-box">
                            <i class="fas fa-calendar-alt"></i>
                            <div class="stat-value">Est. ${area.established}</div>
                        </div>
                        <div class="stat-box">
                            <i class="fas fa-star" style="color: #fbbf24;"></i>
                            <div class="stat-value">${area.rating}/5.0</div>
                        </div>
                    </div>
                    
                    <div class="features-tags">
                        ${area.features.map(feature => `
                            <span class="feature-tag">${feature}</span>
                        `).join('')}
                    </div>
                    
                    <div class="slide-actions">
                        <button class="slide-btn like-btn ${likedItems.has(area.id) ? 'liked' : ''}" onclick="toggleLike(${area.id})">
                            <i class="fas fa-heart"></i>
                            <span>${likedItems.has(area.id) ? 'Liked' : 'Like'}</span>
                        </button>
                        ${area.virtualTour ? `
                            <button class="slide-btn tour-btn">
                                <i class="fas fa-bolt"></i>
                                <span>Virtual Tour</span>
                            </button>
                        ` : ''}
                    </div>
                </div>
            </div>
            
            <div class="facility-highlights">
                <h4 class="highlights-title">
                    <i class="fas fa-book-open"></i>
                    Highlights
                </h4>
                <ul class="highlights-list">
                    ${area.highlights.map(highlight => `
                        <li>• ${highlight}</li>
                    `).join('')}
                </ul>
            </div>
        `;
        
        carouselSlides.appendChild(slide);
    });
}

function renderThumbnails() {
    thumbnailNav.innerHTML = '';
    
    schoolAreas.forEach((area, index) => {
        const thumbnail = document.createElement('div');
        thumbnail.className = `thumbnail ${index === currentSlide ? 'active' : ''}`;
        thumbnail.onclick = () => goToSlide(index);
        
        thumbnail.innerHTML = `
            <img src="${area.image}" alt="${area.name}">
            <div class="thumbnail-overlay" style="background: ${area.color}"></div>
            <div class="thumbnail-content">
                <div class="thumbnail-name">${area.name}</div>
                ${area.virtualTour ? '<div class="vr-indicator"></div>' : ''}
            </div>
        `;
        
        thumbnailNav.appendChild(thumbnail);
    });
}

function renderGridView() {
    gridView.innerHTML = '';
    
    schoolAreas.forEach((area, index) => {
        const gridItem = document.createElement('div');
        gridItem.className = 'grid-item';
        gridItem.onclick = () => {
            setCurrentSlide(index);
            switchViewMode('carousel');
        };
        
        gridItem.innerHTML = `
            <div class="grid-item-image">
                <img src="${area.image}" alt="${area.name}">
                <div class="grid-item-overlay" style="background: ${area.color}"></div>
                <div class="grid-item-content">
                    <h3 class="grid-item-title">${area.name}</h3>
                    <p class="grid-item-description">${area.description}</p>
                    <div class="grid-item-footer">
                        <div class="grid-item-stats">
                            <div class="grid-item-stat">
                                <i class="fas fa-users"></i>
                                <span>${area.capacity}</span>
                            </div>
                            <div class="grid-item-stat">
                                <i class="fas fa-star" style="color: #fbbf24;"></i>
                                <span>${area.rating}</span>
                            </div>
                        </div>
                        <button class="grid-item-like" onclick="event.stopPropagation(); toggleLike(${area.id})">
                            <i class="fas fa-heart ${likedItems.has(area.id) ? 'liked' : ''}"></i>
                        </button>
                    </div>
                </div>
            </div>
        `;
        
        gridView.appendChild(gridItem);
    });
}

function renderListView() {
    listView.innerHTML = '';
    
    schoolAreas.forEach((area, index) => {
        const listItem = document.createElement('div');
        listItem.className = 'list-item';
        listItem.onclick = () => {
            setCurrentSlide(index);
            switchViewMode('carousel');
        };
        
        listItem.innerHTML = `
            <div class="list-item-image">
                <img src="${area.image}" alt="${area.name}">
            </div>
            <div class="list-item-content">
                <div class="list-item-header">
                    <h3 class="list-item-title">${area.name}</h3>
                    <div class="list-item-rating">
                        <i class="fas fa-star" style="color: #fbbf24;"></i>
                        <span>${area.rating}</span>
                    </div>
                </div>
                <p class="list-item-description">${area.description}</p>
                <div class="list-item-footer">
                    <div class="list-item-tags">
                        ${area.features.slice(0, 2).map(feature => `
                            <span class="list-item-tag">${feature}</span>
                        `).join('')}
                    </div>
                    <div class="list-item-capacity">
                        <i class="fas fa-users"></i>
                        <span>${area.capacity}</span>
                    </div>
                </div>
            </div>
        `;
        
        listView.appendChild(listItem);
    });
}

function goToSlide(index) {
    setCurrentSlide(index);
    stopAutoPlay();
    updateVisitCount();
}

function setCurrentSlide(index) {
    currentSlide = index;
    updateCarouselSlides();
    updateThumbnails();
    updateProgressBar();
}

function updateCarouselSlides() {
    const slides = document.querySelectorAll('.slide');
    slides.forEach((slide, index) => {
        slide.className = 'slide';
        if (index === currentSlide) {
            slide.classList.add('active');
        } else if (index < currentSlide) {
            slide.classList.add('prev');
        }
    });
}

function updateThumbnails() {
    const thumbnails = document.querySelectorAll('.thumbnail');
    thumbnails.forEach((thumbnail, index) => {
        thumbnail.classList.toggle('active', index === currentSlide);
    });
}

function updateProgressBar() {
    const progress = ((currentSlide + 1) / schoolAreas.length) * 100;
    progressFill.style.width = `${progress}%`;
}

function nextSlide() {
    currentSlide = (currentSlide + 1) % schoolAreas.length;
    setCurrentSlide(currentSlide);
    updateVisitCount();
}

function prevSlide() {
    currentSlide = (currentSlide - 1 + schoolAreas.length) % schoolAreas.length;
    setCurrentSlide(currentSlide);
}

// Auto-play Functions
function startAutoPlay() {
    if (isAutoPlaying && viewMode === 'carousel') {
        autoPlayInterval = setInterval(nextSlide, 4000);
    }
}

function stopAutoPlay() {
    isAutoPlaying = false;
    clearInterval(autoPlayInterval);
    updatePlayPauseButton();
}

function toggleAutoPlay() {
    isAutoPlaying = !isAutoPlaying;
    if (isAutoPlaying) {
        startAutoPlay();
    } else {
        clearInterval(autoPlayInterval);
    }
    updatePlayPauseButton();
}

function updatePlayPauseButton() {
    const icon = playPauseButton.querySelector('i');
    if (isAutoPlaying) {
        icon.className = 'fas fa-pause';
    } else {
        icon.className = 'fas fa-play';
    }
}

// View Mode Functions
function switchViewMode(mode) {
    viewMode = mode;
    
    // Update view buttons
    viewBtns.forEach(btn => {
        btn.classList.remove('active');
    });
    document.getElementById(`${mode}-btn`).classList.add('active');
    
    // Hide all views
    carouselView.classList.remove('active');
    gridView.classList.remove('active');
    listView.classList.remove('active');
    
    // Show selected view
    switch(mode) {
        case 'carousel':
            carouselView.classList.add('active');
            if (isAutoPlaying) startAutoPlay();
            break;
        case 'grid':
            gridView.classList.add('active');
            renderGridView();
            clearInterval(autoPlayInterval);
            break;
        case 'list':
            listView.classList.add('active');
            renderListView();
            clearInterval(autoPlayInterval);
            break;
    }
}

// Like System
function toggleLike(areaId) {
    if (likedItems.has(areaId)) {
        likedItems.delete(areaId);
    } else {
        likedItems.add(areaId);
    }
    updateStats();
    
    // Update UI based on current view
    if (viewMode === 'carousel') {
        renderCarouselSlides();
    } else if (viewMode === 'grid') {
        renderGridView();
    }
}

// Statistics Functions
function updateStats() {
    likeCountElement.textContent = `${likedItems.size} likes`;
}

function updateVisitCount() {
    visitCount++;
    viewCountElement.textContent = `${visitCount.toLocaleString()} views`;
}

// Modal Functions
function showBookingModal() {
    bookingModal.classList.add('active');
    document.body.style.overflow = 'hidden';
}

function hideBookingModal() {
    bookingModal.classList.remove('active');
    document.body.style.overflow = 'auto';
}

// Share Function
function shareContent() {
    if (navigator.share) {
        navigator.share({
            title: 'School Virtual Tour',
            text: 'Check out our amazing school facilities!',
            url: window.location.href
        }).catch(console.error);
    } else {
        // Fallback for browsers that don't support Web Share API
        const url = window.location.href;
        navigator.clipboard.writeText(url).then(() => {
            alert('Link copied to clipboard!');
        }).catch(() => {
            alert('Share feature activated!');
        });
    }
}

// Fullscreen Function
function toggleFullscreen() {
    if (!document.fullscreenElement) {
        document.documentElement.requestFullscreen().catch(console.error);
    } else {
        document.exitFullscreen().catch(console.error);
    }
}

// Sound Toggle (UI only - no actual audio implementation)
let isMuted = true;
function toggleMute() {
    isMuted = !isMuted;
    const icon = muteBtn.querySelector('i');
    if (isMuted) {
        icon.className = 'fas fa-volume-mute';
    } else {
        icon.className = 'fas fa-volume-up';
    }
}

// Event Listeners
function initializeEventListeners() {
    // Navigation buttons
    prevBtn.addEventListener('click', prevSlide);
    nextBtn.addEventListener('click', nextSlide);
    
    // Media controls
    playPauseBtn.addEventListener('click', toggleAutoPlay);
    muteBtn.addEventListener('click', toggleMute);
    fullscreenBtn.addEventListener('click', toggleFullscreen);
    
    // View mode buttons
    document.getElementById('carousel-btn').addEventListener('click', () => switchViewMode('carousel'));
    document.getElementById('grid-btn').addEventListener('click', () => switchViewMode('grid'));
    document.getElementById('list-btn').addEventListener('click', () => switchViewMode('list'));
    
    // Action buttons
    shareBtn.addEventListener('click', shareContent);
    bookVisitBtn.addEventListener('click', showBookingModal);
    
    // Modal controls
    cancelBookingBtn.addEventListener('click', hideBookingModal);
    bookingModal.addEventListener('click', (e) => {
        if (e.target === bookingModal) {
            hideBookingModal();
        }
    });
    
    // Booking form
    bookingForm.addEventListener('submit', (e) => {
        e.preventDefault();
        alert('Tour booking request submitted successfully!');
        hideBookingModal();
        bookingForm.reset();
    });
    
    // Keyboard navigation
    document.addEventListener('keydown', (e) => {
        if (viewMode === 'carousel') {
            switch(e.key) {
                case 'ArrowLeft':
                    prevSlide();
                    break;
                case 'ArrowRight':
                    nextSlide();
                    break;
                case ' ':
                    e.preventDefault();
                    toggleAutoPlay();
                    break;
                case 'Escape':
                    if (document.fullscreenElement) {
                        document.exitFullscreen();
                    }
                    break;
            }
        }
    });
    
    // Touch/swipe support for mobile
    let touchStartX = 0;
    let touchEndX = 0;
    
    carouselSlides.addEventListener('touchstart', (e) => {
        touchStartX = e.changedTouches[0].screenX;
    });
    
    carouselSlides.addEventListener('touchend', (e) => {
        touchEndX = e.changedTouches[0].screenX;
        handleSwipe();
    });
    
    function handleSwipe() {
        const swipeThreshold = 50;
        const diff = touchStartX - touchEndX;
        
        if (Math.abs(diff) > swipeThreshold) {
            if (diff > 0) {
                nextSlide();
            } else {
                prevSlide();
            }
        }
    }
    
    // Intersection Observer for animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);
    
    // Observe stat cards and feature cards
    document.querySelectorAll('.stat-card, .feature-card').forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(card);
    });
}

// Counter Animation
function animateCounters() {
    const counters = document.querySelectorAll('.counter');
    
    counters.forEach(counter => {
        const target = counter.textContent;
        const numericValue = parseInt(target.replace(/\D/g, ''));
        const suffix = target.replace(/[\d.]/g, '');
        
        let current = 0;
        const increment = numericValue / 100;
        
        const timer = setInterval(() => {
            current += increment;
            if (current >= numericValue) {
                current = numericValue;
                clearInterval(timer);
            }
            
            if (target.includes('.')) {
                counter.textContent = current.toFixed(1) + suffix;
            } else {
                counter.textContent = Math.floor(current) + suffix;
            }
        }, 20);
    });
}

// Initialize counter animation when stats section is visible
const statsSection = document.querySelector('.school-stats');
const statsObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            animateCounters();
            statsObserver.unobserve(entry.target);
        }
    });
}, { threshold: 0.5 });

if (statsSection) {
    statsObserver.observe(statsSection);
}

// Smooth scrolling for internal links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Performance optimization: Lazy loading images
function lazyLoadImages() {
    const images = document.querySelectorAll('img[data-src]');
    const imageObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                img.src = img.dataset.src;
                img.removeAttribute('data-src');
                imageObserver.unobserve(img);
            }
        });
    });
    
    images.forEach(img => imageObserver.observe(img));
}

// Initialize lazy loading if needed
document.addEventListener('DOMContentLoaded', lazyLoadImages);

// Error handling for images
document.addEventListener('error', (e) => {
    if (e.target.tagName === 'IMG') {
        e.target.src = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODAwIiBoZWlnaHQ9IjYwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSIjY2NjIi8+PHRleHQgeD0iNTAlIiB5PSI1MCUiIGZvbnQtc2l6ZT0iMThweCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZHk9Ii4zZW0iIGZpbGw9IiM5OTkiPkltYWdlIE5vdCBBdmFpbGFibGU8L3RleHQ+PC9zdmc+';
        e.target.alt = 'Image not available';
    }
}, true);

// Window resize handler
window.addEventListener('resize', () => {
    // Adjust layout if needed
    if (viewMode === 'carousel') {
        updateCarouselSlides();
    }
});

// Prevent context menu on images (optional)
document.addEventListener('contextmenu', (e) => {
    if (e.target.tagName === 'IMG') {
        e.preventDefault();
    }
});

// Page visibility API to pause auto-play when tab is not visible
document.addEventListener('visibilitychange', () => {
    if (document.hidden) {
        clearInterval(autoPlayInterval);
    } else if (isAutoPlaying && viewMode === 'carousel') {
        startAutoPlay();
    }
});
