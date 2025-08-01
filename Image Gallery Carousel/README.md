# Little Flower English School - Gallery

A modern, responsive image gallery showcasing the beautiful campus facilities of Little Flower English School. Built with vanilla HTML, CSS, and JavaScript featuring smooth animations, multiple view modes, and full accessibility support.

## 🌟 Features

### Gallery Modes
- **Slider View**: Traditional carousel with smooth transitions
- **Grid View**: Modern grid layout showing all images at once
- **Modal View**: Full-screen image preview with detailed captions

### User Experience
- 🎨 Beautiful glassmorphism design with gradient backgrounds
- 📱 Fully responsive design (mobile, tablet, desktop)
- ⌨️ Complete keyboard navigation support
- 🎯 Touch/swipe gestures for mobile devices
- ♿ WCAG accessibility compliant
- 🖼️ Lazy loading for optimal performance
- ⏸️ Auto-play with pause on hover

### Interactive Elements
- Smooth CSS animations and transitions
- Hover effects with image scaling and caption reveals
- Navigation indicators with active states
- Loading animations
- Focus management for screen readers

## 🚀 Quick Start

1. **Download the HTML file**
   ```bash
   # Save the HTML file as index.html
   ```

2. **Open in browser**
   ```bash
   # Simply double-click the HTML file or
   open index.html
   ```

3. **For development server (optional)**
   ```bash
   # Using Python
   python -m http.server 8000
   
   # Using Node.js
   npx http-server
   
   # Using PHP
   php -S localhost:8000
   ```

## 📁 Project Structure

```
school-gallery/
│
├── index.html          # Main gallery file
├── README.md          # This file
└── assets/            # Optional: for custom images
    ├── images/
    └── icons/
```

## 🖼️ Image Configuration

The gallery currently uses high-quality stock images from Unsplash. To use your own images:

1. **Update the `galleryData` array in the JavaScript section:**

```javascript
const galleryData = [
    {
        id: 1,
        src: 'path/to/your/image1.jpg',
        title: 'Your Image Title',
        description: 'Your image description',
        category: 'category-name'
    },
    // Add more images...
];
```

2. **Recommended image specifications:**
   - Format: JPG, PNG, or WebP
   - Resolution: 1200x800px or higher
   - File size: Under 500KB for optimal loading
   - Aspect ratio: 3:2 or 4:3 works best

## 🎨 Customization

### Colors and Themes
The gallery uses CSS custom properties for easy theming:

```css
:root {
    --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    --glass-bg: rgba(255, 255, 255, 0.1);
    --text-primary: white;
    --text-secondary: rgba(255, 255, 255, 0.8);
}
```

### Layout Options
- Modify `max-width` in `.gallery-container` for different container sizes
- Adjust grid columns in `.grid-view` for different layouts
- Change animation durations in transition properties

### Adding New Categories
1. Add category to image data
2. Optionally add filtering functionality
3. Style category-specific elements

## 📱 Browser Support

- ✅ Chrome 60+
- ✅ Firefox 55+
- ✅ Safari 12+
- ✅ Edge 79+
- ✅ Mobile browsers (iOS Safari, Chrome Mobile)

### Progressive Enhancement
- Works without JavaScript (basic image display)
- Graceful fallback for older browsers
- Touch events for mobile optimization

## ♿ Accessibility Features

- **ARIA Labels**: Proper labeling for screen readers
- **Keyboard Navigation**: Full keyboard support
- **Focus Management**: Clear focus indicators
- **Semantic HTML**: Proper heading structure
- **Alt Text**: Descriptive image alternatives
- **Color Contrast**: WCAG AA compliant ratios

### Keyboard Shortcuts
- `Arrow Keys`: Navigate slides (slider mode)
- `Enter/Space`: Activate buttons and open modal
- `Escape`: Close modal
- `Tab`: Navigate through interactive elements

## 🔧 Technical Details

### Dependencies
- **None!** Pure vanilla JavaScript
- Uses modern web APIs:
  - Intersection Observer (lazy loading)
  - CSS Grid and Flexbox
  - CSS Custom Properties
  - Touch Events API

### Performance Optimizations
- Lazy loading images
- CSS transforms for smooth animations
- Debounced resize handlers
- Efficient event delegation
- Minimal DOM manipulation

### Code Structure
```javascript
class SchoolGallery {
    // Main gallery logic
    constructor()           // Initialize gallery
    loadImages()           // Dynamic image loading
    setupEventListeners()  // Event handling
    switchView()           // View mode switching
    openModal()            // Modal functionality
}
```

## 🎯 Use Cases

### Educational Institutions
- School campus tours
- Facility showcases
- Event galleries
- Achievement displays

### Customization for Other Uses
- Business portfolios
- Real estate galleries
- Event photography
- Product showcases

## 🐛 Troubleshooting

### Common Issues

**Images not loading:**
- Check image URLs are accessible
- Verify CORS policies for external images
- Ensure proper image formats

**Layout issues on mobile:**
- Test viewport meta tag
- Check responsive breakpoints
- Verify touch event handling

**Performance problems:**
- Optimize image sizes
- Enable lazy loading
- Check for JavaScript errors

### Debug Mode
Add this to console for debugging:
```javascript
// Enable debug logging
window.galleryDebug = true;
```
## 🔄 Version History

- **v1.0.0** - Initial release with core features
  - Slider and grid views
  - Modal functionality
  - Mobile responsiveness
  - Accessibility support

## 🚀 Future Enhancements

- [ ] Image filtering by category
- [ ] Search functionality
- [ ] Admin panel for image management
- [ ] Integration with CMS
- [ ] Progressive Web App features
- [ ] Advanced animation options

---

**Made with ❤️ for Little Flower English School**

*A modern, accessible, and beautiful way to showcase your school's facilities.*
