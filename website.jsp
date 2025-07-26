import React, { useState, useEffect, useRef } from 'react';
import { ChevronLeft, ChevronRight, MapPin, Users, Clock, Star, Play, Pause, Volume2, VolumeX, Maximize2, Heart, Share2, Download, Eye, Calendar, Award, BookOpen, Zap } from 'lucide-react';

const SchoolTourCarousel = () => {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [isAutoPlaying, setIsAutoPlaying] = useState(true);
  const [isFullscreen, setIsFullscreen] = useState(false);
  const [isMuted, setIsMuted] = useState(true);
  const [liked, setLiked] = useState(new Set());
  const [viewMode, setViewMode] = useState('carousel'); // carousel, grid, list
  const [showStats, setShowStats] = useState(false);
  const [visitCount, setVisitCount] = useState(1247);
  const [showBooking, setShowBooking] = useState(false);
  const [particles, setParticles] = useState([]);
  const audioRef = useRef(null);
  const containerRef = useRef(null);

  // Create floating particles
  useEffect(() => {
    const newParticles = Array.from({ length: 15 }, (_, i) => ({
      id: i,
      x: Math.random() * 100,
      y: Math.random() * 100,
      size: Math.random() * 4 + 2,
      opacity: Math.random() * 0.5 + 0.3,
      speed: Math.random() * 2 + 1
    }));
    setParticles(newParticles);
  }, []);

  const schoolAreas = [
    {
      id: 1,
      name: "Main Hall",
      image: "https://images.unsplash.com/photo-1571260899304-425eee4c7efc?w=800&h=600&fit=crop",
      description: "Our grand main hall hosts assemblies, performances, and special events with state-of-the-art acoustics.",
      features: ["500+ Capacity", "Modern Audio/Visual", "Air Conditioned"],
      color: "from-blue-500 to-purple-600",
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
      color: "from-emerald-500 to-teal-600",
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
      color: "from-orange-500 to-red-600",
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
      color: "from-cyan-500 to-blue-600",
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
      color: "from-green-500 to-emerald-600",
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
      color: "from-purple-500 to-pink-600",
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
      color: "from-pink-500 to-rose-600",
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
      color: "from-violet-500 to-purple-600",
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
      color: "from-yellow-500 to-orange-600",
      capacity: "150 students",
      established: "2016",
      rating: 4.6,
      virtualTour: false,
      highlights: ["Safety first", "Age-appropriate", "Supervised play"]
    }
  ];

  // Auto-play functionality
  useEffect(() => {
    if (!isAutoPlaying || viewMode !== 'carousel') return;
    
    const interval = setInterval(() => {
      setCurrentSlide((prev) => (prev + 1) % schoolAreas.length);
    }, 4000);

    return () => clearInterval(interval);
  }, [isAutoPlaying, schoolAreas.length, viewMode]);

  // Particle animation
  useEffect(() => {
    const animateParticles = () => {
      setParticles(prev => prev.map(particle => ({
        ...particle,
        y: (particle.y + particle.speed * 0.1) % 100,
        x: particle.x + Math.sin(Date.now() * 0.001 + particle.id) * 0.1
      })));
    };

    const interval = setInterval(animateParticles, 50);
    return () => clearInterval(interval);
  }, []);

  const nextSlide = () => {
    setCurrentSlide((prev) => (prev + 1) % schoolAreas.length);
    setIsAutoPlaying(false);
    setVisitCount(prev => prev + 1);
  };

  const prevSlide = () => {
    setCurrentSlide((prev) => (prev - 1 + schoolAreas.length) % schoolAreas.length);
    setIsAutoPlaying(false);
  };

  const goToSlide = (index) => {
    setCurrentSlide(index);
    setIsAutoPlaying(false);
  };

  const toggleLike = (id) => {
    setLiked(prev => {
      const newLiked = new Set(prev);
      if (newLiked.has(id)) {
        newLiked.delete(id);
      } else {
        newLiked.add(id);
      }
      return newLiked;
    });
  };

  const handleShare = () => {
    navigator.share?.({
      title: 'School Virtual Tour',
      text: 'Check out our amazing school facilities!',
      url: window.location.href
    }) || alert('Share feature activated!');
  };

  const toggleFullscreen = () => {
    if (!document.fullscreenElement) {
      containerRef.current?.requestFullscreen();
      setIsFullscreen(true);
    } else {
      document.exitFullscreen();
      setIsFullscreen(false);
    }
  };

  const currentArea = schoolAreas[currentSlide];

  // Grid View Component
  const GridView = () => (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-7xl mx-auto px-4">
      {schoolAreas.map((area, index) => (
        <div
          key={area.id}
          className="group relative bg-white/10 backdrop-blur-sm rounded-2xl overflow-hidden border border-white/20 hover:border-white/40 transition-all duration-500 hover:scale-105 hover:shadow-2xl cursor-pointer"
          onClick={() => {
            setCurrentSlide(index);
            setViewMode('carousel');
          }}
        >
          <div className="relative h-64 overflow-hidden">
            <img
              src={area.image}
              alt={area.name}
              className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
            />
            <div className={`absolute inset-0 bg-gradient-to-t ${area.color} opacity-60 group-hover:opacity-40 transition-opacity`}></div>
            
            {/* Overlay Content */}
            <div className="absolute inset-0 p-6 flex flex-col justify-end">
              <h3 className="text-2xl font-bold text-white mb-2">{area.name}</h3>
              <p className="text-white/90 text-sm mb-4 line-clamp-2">{area.description}</p>
              
              <div className="flex items-center justify-between">
                <div className="flex items-center space-x-4 text-white/80 text-sm">
                  <span className="flex items-center">
                    <Users className="w-4 h-4 mr-1" />
                    {area.capacity}
                  </span>
                  <span className="flex items-center">
                    <Star className="w-4 h-4 mr-1 text-yellow-400" />
                    {area.rating}
                  </span>
                </div>
                
                <button
                  onClick={(e) => {
                    e.stopPropagation();
                    toggleLike(area.id);
                  }}
                  className="text-red-400 hover:text-red-300 transition-colors"
                >
                  <Heart className={`w-5 h-5 ${liked.has(area.id) ? 'fill-current' : ''}`} />
                </button>
              </div>
            </div>
          </div>
        </div>
      ))}
    </div>
  );

  // List View Component
  const ListView = () => (
    <div className="max-w-4xl mx-auto px-4 space-y-6">
      {schoolAreas.map((area, index) => (
        <div
          key={area.id}
          className="flex bg-white/10 backdrop-blur-sm rounded-2xl overflow-hidden border border-white/20 hover:border-white/40 transition-all duration-300 cursor-pointer group"
          onClick={() => {
            setCurrentSlide(index);
            setViewMode('carousel');
          }}
        >
          <div className="w-48 h-32 flex-shrink-0">
            <img
              src={area.image}
              alt={area.name}
              className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
            />
          </div>
          
          <div className="flex-1 p-6">
            <div className="flex items-start justify-between mb-2">
              <h3 className="text-xl font-bold text-white">{area.name}</h3>
              <div className="flex items-center space-x-2">
                <Star className="w-4 h-4 text-yellow-400" />
                <span className="text-white/80 text-sm">{area.rating}</span>
              </div>
            </div>
            
            <p className="text-white/70 text-sm mb-3 line-clamp-2">{area.description}</p>
            
            <div className="flex items-center justify-between">
              <div className="flex flex-wrap gap-2">
                {area.features.slice(0, 2).map((feature, idx) => (
                  <span
                    key={idx}
                    className="bg-white/20 px-2 py-1 rounded-full text-xs text-white/80"
                  >
                    {feature}
                  </span>
                ))}
              </div>
              
              <div className="flex items-center space-x-2 text-white/60 text-sm">
                <Users className="w-4 h-4" />
                <span>{area.capacity}</span>
              </div>
            </div>
          </div>
        </div>
      ))}
    </div>
  );

  return (
    <div ref={containerRef} className="min-h-screen bg-gradient-to-br from-slate-900 via-blue-900 to-slate-800 relative overflow-hidden">
      {/* Floating Particles */}
      {particles.map(particle => (
        <div
          key={particle.id}
          className="absolute w-2 h-2 bg-white/30 rounded-full pointer-events-none"
          style={{
            left: `${particle.x}%`,
            top: `${particle.y}%`,
            opacity: particle.opacity,
            transform: `scale(${particle.size / 4})`
          }}
        />
      ))}

      {/* Header with Enhanced Navigation */}
      <header className="relative z-20 p-6">
        <div className="max-w-7xl mx-auto">
          <div className="flex flex-col md:flex-row items-center justify-between mb-6">
            <div className="text-center md:text-left mb-4 md:mb-0">
              <h1 className="text-4xl md:text-6xl font-bold text-white mb-2 tracking-tight">
                School Tour
                <span className="text-2xl md:text-3xl ml-4 text-blue-300 font-normal">2025</span>
              </h1>
              <p className="text-xl text-blue-200 max-w-2xl">
                Immersive virtual experience of our facilities
              </p>
            </div>
            
            {/* Enhanced Controls */}
            <div className="flex items-center space-x-4">
              <div className="flex items-center bg-white/10 backdrop-blur-sm rounded-full p-1 border border-white/20">
                <button
                  onClick={() => setViewMode('carousel')}
                  className={`px-4 py-2 rounded-full text-sm transition-all ${
                    viewMode === 'carousel' ? 'bg-white text-gray-900' : 'text-white hover:bg-white/20'
                  }`}
                >
                  Carousel
                </button>
                <button
                  onClick={() => setViewMode('grid')}
                  className={`px-4 py-2 rounded-full text-sm transition-all ${
                    viewMode === 'grid' ? 'bg-white text-gray-900' : 'text-white hover:bg-white/20'
                  }`}
                >
                  Grid
                </button>
                <button
                  onClick={() => setViewMode('list')}
                  className={`px-4 py-2 rounded-full text-sm transition-all ${
                    viewMode === 'list' ? 'bg-white text-gray-900' : 'text-white hover:bg-white/20'
                  }`}
                >
                  List
                </button>
              </div>
              
              {/* Action Buttons */}
              <div className="flex items-center space-x-2">
                <button
                  onClick={handleShare}
                  className="p-2 bg-white/10 backdrop-blur-sm rounded-full border border-white/20 text-white hover:bg-white/20 transition-all"
                  title="Share Tour"
                >
                  <Share2 className="w-5 h-5" />
                </button>
                <button
                  onClick={() => setShowBooking(true)}
                  className="px-4 py-2 bg-gradient-to-r from-blue-500 to-purple-600 text-white rounded-full font-semibold hover:shadow-lg transition-all"
                >
                  Book Visit
                </button>
              </div>
            </div>
          </div>
          
          {/* Live Stats */}
          <div className="flex items-center justify-center space-x-8 text-white/80 text-sm">
            <div className="flex items-center">
              <Eye className="w-4 h-4 mr-2" />
              <span>{visitCount.toLocaleString()} views</span>
            </div>
            <div className="flex items-center">
              <Heart className="w-4 h-4 mr-2 text-red-400" />
              <span>{liked.size} likes</span>
            </div>
            <div className="flex items-center">
              <Award className="w-4 h-4 mr-2 text-yellow-400" />
              <span>Premium Tour</span>
            </div>
          </div>
        </div>
      </header>

      {/* Main Content Area */}
      <div className="relative max-w-7xl mx-auto px-4 py-8">
        {viewMode === 'carousel' && (
          <>
            {/* Enhanced Carousel */}
            <div className="relative h-[600px] md:h-[700px] overflow-hidden rounded-2xl shadow-2xl group">
              {schoolAreas.map((area, index) => (
                <div
                  key={area.id}
                  className={`absolute inset-0 transition-all duration-1000 ease-in-out ${
                    index === currentSlide 
                      ? 'opacity-100 transform translate-x-0' 
                      : index < currentSlide 
                        ? 'opacity-0 transform -translate-x-full' 
                        : 'opacity-0 transform translate-x-full'
                  }`}
                >
                  <div className="relative h-full">
                    <img
                      src={area.image}
                      alt={area.name}
                      className="w-full h-full object-cover"
                    />
                    <div className={`absolute inset-0 bg-gradient-to-r ${area.color} opacity-75`}></div>
                    
                    {/* Enhanced Content Overlay */}
                    <div className="absolute inset-0 flex items-center justify-center">
                      <div className="text-center text-white p-8 max-w-5xl mx-auto">
                        <div className="mb-4">
                          <span className="bg-white/20 backdrop-blur-sm px-3 py-1 rounded-full text-sm font-semibold border border-white/30">
                            {area.virtualTour ? '360° Virtual Tour Available' : 'Photo Gallery'}
                          </span>
                        </div>
                        
                        <h2 className="text-5xl md:text-7xl font-bold mb-4 animate-pulse">
                          {area.name}
                        </h2>
                        
                        <p className="text-xl md:text-2xl mb-6 leading-relaxed opacity-90 max-w-3xl mx-auto">
                          {area.description}
                        </p>

                        {/* Interactive Stats */}
                        <div className="flex flex-wrap justify-center gap-6 mb-8">
                          <div className="bg-white/20 backdrop-blur-sm px-4 py-3 rounded-xl border border-white/30 text-center">
                            <Users className="w-6 h-6 mx-auto mb-1" />
                            <div className="text-sm font-semibold">{area.capacity}</div>
                          </div>
                          <div className="bg-white/20 backdrop-blur-sm px-4 py-3 rounded-xl border border-white/30 text-center">
                            <Calendar className="w-6 h-6 mx-auto mb-1" />
                            <div className="text-sm font-semibold">Est. {area.established}</div>
                          </div>
                          <div className="bg-white/20 backdrop-blur-sm px-4 py-3 rounded-xl border border-white/30 text-center">
                            <Star className="w-6 h-6 mx-auto mb-1 text-yellow-400" />
                            <div className="text-sm font-semibold">{area.rating}/5.0</div>
                          </div>
                        </div>

                        {/* Features */}
                        <div className="flex flex-wrap justify-center gap-4 mb-8">
                          {area.features.map((feature, idx) => (
                            <span
                              key={idx}
                              className="bg-white/20 backdrop-blur-sm px-4 py-2 rounded-full text-sm font-semibold border border-white/30 hover:bg-white/30 transition-all duration-300 hover:scale-105"
                            >
                              {feature}
                            </span>
                          ))}
                        </div>

                        {/* Action Buttons */}
                        <div className="flex flex-wrap justify-center gap-4">
                          <button
                            onClick={() => toggleLike(area.id)}
                            className={`flex items-center space-x-2 px-6 py-3 rounded-full font-semibold transition-all duration-300 ${
                              liked.has(area.id)
                                ? 'bg-red-500 text-white hover:bg-red-600'
                                : 'bg-white/20 backdrop-blur-sm text-white border border-white/30 hover:bg-white/30'
                            }`}
                          >
                            <Heart className={`w-5 h-5 ${liked.has(area.id) ? 'fill-current' : ''}`} />
                            <span>{liked.has(area.id) ? 'Liked' : 'Like'}</span>
                          </button>
                          
                          {area.virtualTour && (
                            <button className="flex items-center space-x-2 px-6 py-3 bg-gradient-to-r from-blue-500 to-purple-600 text-white rounded-full font-semibold hover:shadow-lg transition-all duration-300 hover:scale-105">
                              <Zap className="w-5 h-5" />
                              <span>Virtual Tour</span>
                            </button>
                          )}
                        </div>
                      </div>
                    </div>

                    {/* Facility Highlights */}
                    <div className="absolute bottom-6 left-6 bg-white/10 backdrop-blur-sm rounded-xl p-4 border border-white/20 max-w-sm">
                      <h4 className="text-white font-semibold mb-2 flex items-center">
                        <BookOpen className="w-4 h-4 mr-2" />
                        Highlights
                      </h4>
                      <ul className="text-white/80 text-sm space-y-1">
                        {area.highlights.map((highlight, idx) => (
                          <li key={idx}>• {highlight}</li>
                        ))}
                      </ul>
                    </div>
                  </div>
                </div>
              ))}

              {/* Enhanced Navigation */}
              <button
                onClick={prevSlide}
                className="absolute left-4 top-1/2 transform -translate-y-1/2 bg-white/20 backdrop-blur-sm hover:bg-white/30 p-4 rounded-full transition-all duration-300 group opacity-0 group-hover:opacity-100"
              >
                <ChevronLeft className="w-8 h-8 text-white group-hover:scale-110 transition-transform" />
              </button>
              <button
                onClick={nextSlide}
                className="absolute right-4 top-1/2 transform -translate-y-1/2 bg-white/20 backdrop-blur-sm hover:bg-white/30 p-4 rounded-full transition-all duration-300 group opacity-0 group-hover:opacity-100"
              >
                <ChevronRight className="w-8 h-8 text-white group-hover:scale-110 transition-transform" />
              </button>

              {/* Media Controls */}
              <div className="absolute top-4 right-4 flex items-center space-x-2 opacity-0 group-hover:opacity-100 transition-opacity">
                <button
                  onClick={() => setIsAutoPlaying(!isAutoPlaying)}
                  className="p-2 bg-white/20 backdrop-blur-sm rounded-full border border-white/30 text-white hover:bg-white/30 transition-all"
                >
                  {isAutoPlaying ? <Pause className="w-4 h-4" /> : <Play className="w-4 h-4" />}
                </button>
                <button
                  onClick={() => setIsMuted(!isMuted)}
                  className="p-2 bg-white/20 backdrop-blur-sm rounded-full border border-white/30 text-white hover:bg-white/30 transition-all"
                >
                  {isMuted ? <VolumeX className="w-4 h-4" /> : <Volume2 className="w-4 h-4" />}
                </button>
                <button
                  onClick={toggleFullscreen}
                  className="p-2 bg-white/20 backdrop-blur-sm rounded-full border border-white/30 text-white hover:bg-white/30 transition-all"
                >
                  <Maximize2 className="w-4 h-4" />
                </button>
              </div>
            </div>

            {/* Enhanced Thumbnail Navigation */}
            <div className="flex justify-center mt-8 space-x-2 overflow-x-auto py-4">
              {schoolAreas.map((area, index) => (
                <button
                  key={area.id}
                  onClick={() => goToSlide(index)}
                  className={`relative flex-shrink-0 w-20 h-20 md:w-24 md:h-24 rounded-xl overflow-hidden transition-all duration-300 ${
                    index === currentSlide 
                      ? 'ring-4 ring-white shadow-lg scale-110' 
                      : 'hover:scale-105 opacity-70 hover:opacity-100'
                  }`}
                >
                  <img
                    src={area.image}
                    alt={area.name}
                    className="w-full h-full object-cover"
                  />
                  <div className={`absolute inset-0 bg-gradient-to-br ${area.color} opacity-60`}></div>
                  <div className="absolute inset-0 flex flex-col items-center justify-center">
                    <span className="text-white text-xs font-bold text-center px-1 mb-1">
                      {area.name}
                    </span>
                    {area.virtualTour && (
                      <div className="w-2 h-2 bg-green-400 rounded-full animate-pulse"></div>
                    )}
                  </div>
                </button>
              ))}
            </div>

            {/* Progress Bar */}
            <div className="flex justify-center mt-6">
              <div className="w-64 h-1 bg-white/20 rounded-full overflow-hidden">
                <div 
                  className="h-full bg-gradient-to-r from-blue-400 to-purple-400 transition-all duration-300"
                  style={{ width: `${((currentSlide + 1) / schoolAreas.length) * 100}%` }}
                ></div>
              </div>
            </div>
          </>
        )}

        {viewMode === 'grid' && <GridView />}
        {viewMode === 'list' && <ListView />}
      </div>

      {/* Enhanced School Stats */}
      <div className="max-w-6xl mx-auto px-4 py-12">
        <div className="text-center mb-8">
          <h3 className="text-3xl font-bold text-white mb-2">School at a Glance</h3>
          <p className="text-blue-200">Excellence in education since 2010</p>
        </div>
        
        <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
          <div className="text-center p-6 bg-white/10 backdrop-blur-sm rounded-xl border border-white/20 hover:bg-white/20 transition-all duration-300 group">
            <Users className="w-12 h-12 text-blue-400 mx-auto mb-4 group-hover:scale-110 transition-transform" />
            <div className="text-3xl font-bold text-white mb-2 counter">1200+</div>
            <div className="text-blue-200">Students</div>
          </div>
          <div className="text-center p-6 bg-white/10 backdrop-blur-sm rounded-xl border border-white/20 hover:bg-white/20 transition-all duration-300 group">
            <MapPin className="w-12 h-12 text-green-400 mx-auto mb-4 group-hover:scale-110 transition-transform" />
            <div className="text-3xl font-bold text-white mb-2 counter">50+</div>
            <div className="text-blue-200">Facilities</div>
          </div>
          <div className="text-center p-6 bg-white/10 backdrop-blur-sm rounded-xl border border-white/20 hover:bg-white/20 transition-all duration-300 group">
            <Clock className="w-12 h-12 text-purple-400 mx-auto mb-4 group-hover:scale-110 transition-transform" />
            <div className="text-3xl font-bold text-white mb-2 counter">15+</div>
            <div className="text-blue-200">Years Excellence</div>
          </div>
          <div className="text-center p-6 bg-white/10 backdrop-blur-sm rounded-xl border border-white/20 hover:bg-white/20 transition-all duration-300 group">
            <Star className="w-12 h-12 text-yellow-400 mx-auto mb-4 group-hover:scale-110 transition-transform" />
            <div className="text-3xl font-bold text-white mb-2 counter">4.9</div>
            <div className="text-blue-200">Rating</div>
          </div>
        </div>
      </div>

      {/* Interactive Features Section */}
      <div className="max-w-6xl mx-auto px-4 py-12">
        <div className="text-center mb-12">
          <h3 className="text-4xl font-bold text-white mb-4">Tour Features</h3>
          <p className="text-xl text-blue-200">Experience our school like never before</p>
        </div>
        
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div className="bg-gradient-to-br from-blue-500/20 to-purple-600/20 backdrop-blur-sm rounded-2xl p-8 border border-white/20 hover:border-white/40 transition-all duration-300 hover:scale-105 group">
            <div className="w-16 h-16 bg-gradient-to-r from-blue-500 to-purple-600 rounded-full flex items-center justify-center mb-6 group-hover:rotate-12 transition-transform">
              <Zap className="w-8 h-8 text-white" />
            </div>
            <h4 className="text-2xl font-bold text-white mb-4">360° Virtual Tours</h4>
            <p className="text-white/80 mb-4">Immersive virtual reality experience of our key facilities with interactive hotspots and detailed information.</p>
            <ul className="text-white/60 text-sm space-y-2">
              <li>• Interactive hotspots</li>
              <li>• 4K resolution imagery</li>
              <li>• Mobile VR compatible</li>
            </ul>
          </div>

          <div className="bg-gradient-to-br from-green-500/20 to-emerald-600/20 backdrop-blur-sm rounded-2xl p-8 border border-white/20 hover:border-white/40 transition-all duration-300 hover:scale-105 group">
            <div className="w-16 h-16 bg-gradient-to-r from-green-500 to-emerald-600 rounded-full flex items-center justify-center mb-6 group-hover:rotate-12 transition-transform">
              <Heart className="w-8 h-8 text-white" />
            </div>
            <h4 className="text-2xl font-bold text-white mb-4">Interactive Elements</h4>
            <p className="text-white/80 mb-4">Like your favorite spaces, share the tour with friends, and bookmark areas for future visits.</p>
            <ul className="text-white/60 text-sm space-y-2">
              <li>• Like & favorite system</li>
              <li>• Social sharing</li>
              <li>• Personal bookmarks</li>
            </ul>
          </div>

          <div className="bg-gradient-to-br from-orange-500/20 to-red-600/20 backdrop-blur-sm rounded-2xl p-8 border border-white/20 hover:border-white/40 transition-all duration-300 hover:scale-105 group">
            <div className="w-16 h-16 bg-gradient-to-r from-orange-500 to-red-600 rounded-full flex items-center justify-center mb-6 group-hover:rotate-12 transition-transform">
              <Calendar className="w-8 h-8 text-white" />
            </div>
            <h4 className="text-2xl font-bold text-white mb-4">Book Physical Tours</h4>
            <p className="text-white/80 mb-4">Schedule in-person visits, meet with faculty, and experience our facilities firsthand.</p>
            <ul className="text-white/60 text-sm space-y-2">
              <li>• Online scheduling</li>
              <li>• Guided tours available</li>
              <li>• Meet the faculty</li>
            </ul>
          </div>

          <div className="bg-gradient-to-br from-purple-500/20 to-pink-600/20 backdrop-blur-sm rounded-2xl p-8 border border-white/20 hover:border-white/40 transition-all duration-300 hover:scale-105 group">
            <div className="w-16 h-16 bg-gradient-to-r from-purple-500 to-pink-600 rounded-full flex items-center justify-center mb-6 group-hover:rotate-12 transition-transform">
              <Eye className="w-8 h-8 text-white" />
            </div>
            <h4 className="text-2xl font-bold text-white mb-4">Multiple View Modes</h4>
            <p className="text-white/80 mb-4">Switch between carousel, grid, and list views for the perfect browsing experience on any device.</p>
            <ul className="text-white/60 text-sm space-y-2">
              <li>• Carousel presentation</li>
              <li>• Grid gallery view</li>
              <li>• Detailed list view</li>
            </ul>
          </div>

          <div className="bg-gradient-to-br from-cyan-500/20 to-blue-600/20 backdrop-blur-sm rounded-2xl p-8 border border-white/20 hover:border-white/40 transition-all duration-300 hover:scale-105 group">
            <div className="w-16 h-16 bg-gradient-to-r from-cyan-500 to-blue-600 rounded-full flex items-center justify-center mb-6 group-hover:rotate-12 transition-transform">
              <Download className="w-8 h-8 text-white" />
            </div>
            <h4 className="text-2xl font-bold text-white mb-4">Smart Features</h4>
            <p className="text-white/80 mb-4">Auto-play tours, fullscreen mode, sound controls, and live visitor statistics for an enhanced experience.</p>
            <ul className="text-white/60 text-sm space-y-2">
              <li>• Auto-play functionality</li>
              <li>• Fullscreen immersion</li>
              <li>• Live visitor stats</li>
            </ul>
          </div>

          <div className="bg-gradient-to-br from-yellow-500/20 to-orange-600/20 backdrop-blur-sm rounded-2xl p-8 border border-white/20 hover:border-white/40 transition-all duration-300 hover:scale-105 group">
            <div className="w-16 h-16 bg-gradient-to-r from-yellow-500 to-orange-600 rounded-full flex items-center justify-center mb-6 group-hover:rotate-12 transition-transform">
              <Award className="w-8 h-8 text-white" />
            </div>
            <h4 className="text-2xl font-bold text-white mb-4">Premium Experience</h4>
            <p className="text-white/80 mb-4">High-quality imagery, smooth animations, and professional presentation showcase our commitment to excellence.</p>
            <ul className="text-white/60 text-sm space-y-2">
              <li>• HD image quality</li>
              <li>• Smooth animations</li>
              <li>• Professional design</li>
            </ul>
          </div>
        </div>
      </div>

      {/* Booking Modal */}
      {showBooking && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4">
          <div className="bg-white/10 backdrop-blur-sm rounded-2xl p-8 border border-white/20 max-w-md w-full">
            <h3 className="text-2xl font-bold text-white mb-6">Book a Physical Tour</h3>
            <form className="space-y-4">
              <div>
                <label className="block text-white/80 text-sm mb-2">Name</label>
                <input
                  type="text"
                  className="w-full bg-white/10 border border-white/20 rounded-lg px-4 py-2 text-white placeholder-white/50 focus:outline-none focus:ring-2 focus:ring-blue-400"
                  placeholder="Your full name"
                />
              </div>
              <div>
                <label className="block text-white/80 text-sm mb-2">Email</label>
                <input
                  type="email"
                  className="w-full bg-white/10 border border-white/20 rounded-lg px-4 py-2 text-white placeholder-white/50 focus:outline-none focus:ring-2 focus:ring-blue-400"
                  placeholder="your.email@example.com"
                />
              </div>
              <div>
                <label className="block text-white/80 text-sm mb-2">Preferred Date</label>
                <input
                  type="date"
                  className="w-full bg-white/10 border border-white/20 rounded-lg px-4 py-2 text-white focus:outline-none focus:ring-2 focus:ring-blue-400"
                />
              </div>
              <div className="flex space-x-4 pt-4">
                <button
                  type="button"
                  onClick={() => setShowBooking(false)}
                  className="flex-1 px-4 py-2 bg-white/10 border border-white/20 text-white rounded-lg hover:bg-white/20 transition-all"
                >
                  Cancel
                </button>
                <button
                  type="submit"
                  className="flex-1 px-4 py-2 bg-gradient-to-r from-blue-500 to-purple-600 text-white rounded-lg hover:shadow-lg transition-all"
                  onClick={(e) => {
                    e.preventDefault();
                    alert('Tour booking request submitted!');
                    setShowBooking(false);
                  }}
                >
                  Book Now
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Footer */}
      <footer className="text-center p-8 text-blue-200 border-t border-white/10">
        <div className="max-w-4xl mx-auto">
          <p className="text-lg mb-4">Welcome to our school - Where learning comes alive!</p>
          <div className="flex justify-center items-center space-x-6 text-sm text-white/60">
            <span>© 2025 School Virtual Tour</span>
            <span>•</span>
            <span>Interactive Experience</span>
            <span>•</span>
            <span>Premium Quality</span>
          </div>
        </div>
      </footer>
    </div>
  );
};

export default SchoolTourCarousel;
