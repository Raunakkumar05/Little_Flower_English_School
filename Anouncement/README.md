# Little Flower English School -  Announcements

A modern, responsive web application showcasing the school's facilities through an interactive gallery and providing important announcements to students, parents, and staff.

## 🌟 Features

### Announcements System
- **Priority-based Display**: High, medium, and low priority announcements
- **Categorization**: Events, Academic, Library, Administration, etc.
- **Expandable Cards**: Click to reveal full announcement details
- **Date Formatting**: Smart date display with "days ago" calculation
- **Pagination**: Navigate through multiple pages of announcements
- **Collapsible View**: Toggle between expanded and collapsed views

### Responsive Design
- **Mobile-First**: Optimized for all screen sizes
- **Touch-Friendly**: Large tap targets and gesture support
- **Accessibility**: ARIA labels, keyboard navigation, screen reader support
- **Modern UI**: Glass morphism effects with smooth animations

## 🚀 Getting Started

### Prerequisites
- A modern web browser (Chrome, Firefox, Safari, Edge)
- No server setup required - runs entirely in the browser

### Installation
1. Download or clone the repository
2. Open `index.html` in your web browser
3. That's it! The application will load automatically

```bash
# Clone the repository
git clone [repository-url]

# Navigate to the project directory
cd little-flower-school-gallery

# Open in browser (or double-click index.html)
open index.html
```

## 📁 Project Structure

```
little-flower-school-gallery/
│
├── index.html              # Main HTML file
├── README.md              # This file
└── assets/                # Optional assets folder
    ├── images/            # Local image storage (if needed)
    └── docs/              # Additional documentation
```

## 🖼️ Gallery Configuration

### Adding New Images
To add new images to the gallery, modify the `galleryData` array in the JavaScript section:

```javascript
const galleryData = [
    {
        id: 1,
        src: 'path/to/your/image.jpg',
        title: 'Image Title',
        description: 'Detailed description of the image',
        category: 'category_name'
    },
    // Add more images here...
];
```

### Image Categories
Available categories:
- `hall` - Main halls and auditoriums
- `classroom` - Classrooms and learning spaces
- `laboratory` - Science and computer labs
- `library` - Library and reading areas
- `playground` - Sports and recreational areas
- `canteen` - Dining and food service areas
- `garden` - Outdoor spaces and gardens

## 📢 Announcements Management

### Adding New Announcements
Update the `announcementsData` array to add new announcements:

```javascript
const announcementsData = [
    {
        id: 1,
        title: "Announcement Title",
        date: "2025-08-15",           // Format: YYYY-MM-DD
        category: "Events",           // Category name
        priority: "high",            // high, medium, or low
        preview: "Short preview text...",
        content: "Full announcement content..."
    },
    // Add more announcements here...
];
```

### Priority Levels
- **High**: 🔥 Important events, urgent notices
- **Medium**: ⚡ Regular updates, meetings
- **Low**: 📌 General information, reminders

### Categories
- Events
- Academic
- Library
- Administration
- Infrastructure
- Safety
- Services
- Results

## 🎨 Customization

### Color Scheme
The application uses CSS custom properties for easy theming. Key colors can be modified in the CSS:

```css
:root {
    --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    --glass-bg: rgba(255, 255, 255, 0.1);
    --text-primary: white;
    --text-secondary: rgba(255, 255, 255, 0.8);
}
```

### School Branding
1. Update the school name in the header
2. Replace the gradient background with school colors
3. Add school logo to the header section
4. Modify the favicon (add `<link rel="icon" href="path/to/favicon.ico">`)

## 📱 Responsive Breakpoints

- **Desktop**: > 768px
- **Tablet**: 481px - 768px
- **Mobile**: ≤ 480px

Each breakpoint has optimized layouts and touch targets.

## ♿ Accessibility Features

- **ARIA Labels**: Comprehensive labeling for screen readers
- **Keyboard Navigation**: Full keyboard support
- **Focus Management**: Visible focus indicators
- **Semantic HTML**: Proper heading structure and landmarks
- **Alt Text**: Descriptive alternative text for all images
- **Color Contrast**: High contrast ratios for readability

## 🔧 Browser Support

- **Chrome**: 60+
- **Firefox**: 55+
- **Safari**: 12+
- **Edge**: 79+
- **Mobile browsers**: iOS Safari 12+, Chrome Mobile 60+

## 📊 Performance Features

- **Lazy Loading**: Images load only when needed
- **Intersection Observer**: Modern performance monitoring
- **Efficient DOM**: Minimal DOM manipulation
- **CSS Animations**: Hardware-accelerated transitions
- **Optimized Images**: Responsive image sizing

## 🐛 Troubleshooting

### Common Issues

**Images not loading:**
- Check image URLs in `galleryData`
- Ensure images are accessible (CORS policy)
- Verify internet connection for external images

**Announcements not displaying:**
- Verify date format (YYYY-MM-DD) in `announcementsData`
- Check for JavaScript console errors
- Ensure valid JSON syntax

**Responsive issues:**
- Clear browser cache
- Check viewport meta tag
- Test in different browsers

### Debug Mode
Add this to the browser console for debugging:

```javascript
// Check current gallery state
console.log(gallery.currentSlide, gallery.viewMode);

// Check announcements data
console.log(announcementsManager.announcements);
```

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Contribution Guidelines
- Maintain responsive design principles
- Follow accessibility standards (WCAG 2.1)
- Test across multiple browsers and devices
- Update documentation for new features

## 📞 Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation in `/docs`

## 🔄 Version History

- **v1.0.0** - Initial release with gallery and announcements
- **v1.1.0** - Added touch support and performance optimizations
- **v1.2.0** - Enhanced accessibility and mobile experience

## 🎯 Future Enhancements

- [ ] Admin panel for content management
- [ ] Search functionality for announcements
- [ ] Image upload interface
- [ ] Multi-language support
- [ ] PWA capabilities
- [ ] Dark/light theme toggle
- [ ] Email notifications for announcements
- [ ] Social media integration

## 📚 Technical Stack

- **HTML5**: Semantic structure
- **CSS3**: Modern styling with Grid/Flexbox
- **Vanilla JavaScript**: No external dependencies
- **Progressive Enhancement**: Works without JavaScript
- **Modern Web APIs**: Intersection Observer, Touch Events

## 🏆 Best Practices Implemented

- **Mobile-First Design**: Optimized for mobile devices
- **Progressive Enhancement**: Core functionality works without JS
- **Accessibility First**: WCAG 2.1 AA compliance
- **Performance Optimized**: Fast loading and smooth interactions
- **SEO Ready**: Semantic HTML structure
- **Cross-Browser Compatible**: Works across all modern browsers

---

**Little Flower English School Gallery & Announcements** - Connecting students, parents, and educators through technology. 🌸📚
