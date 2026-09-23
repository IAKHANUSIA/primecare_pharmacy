/* ==========================================================================
   Primecare Pharmacy - Interactive UI JavaScript
   Fully Responsive for Touch, Mobile, Tablet, and Desktop
   ========================================================================== */

document.addEventListener('DOMContentLoaded', function () {

  // 1. Hero Image Slider with Auto Rotation & Pause on Hover
  const heroSection = document.querySelector('.hero-section');
  const heroSlides = document.querySelectorAll('.hero-slide');
  const heroDots = document.querySelectorAll('.hero-dot');
  
  if (heroSlides.length > 0) {
    let currentHeroIndex = 0;
    let heroTimer = null;

    function goToHeroSlide(index) {
      heroSlides.forEach((slide, i) => {
        slide.classList.toggle('active', i === index);
      });
      heroDots.forEach((dot, i) => {
        dot.classList.toggle('active', i === index);
      });
      currentHeroIndex = index;
    }

    function nextHeroSlide() {
      const nextIndex = (currentHeroIndex + 1) % heroSlides.length;
      goToHeroSlide(nextIndex);
    }

    function startHeroAutoSlide() {
      if (heroTimer) clearInterval(heroTimer);
      heroTimer = setInterval(nextHeroSlide, 4500);
    }

    function stopHeroAutoSlide() {
      if (heroTimer) clearInterval(heroTimer);
    }

    heroDots.forEach((dot, index) => {
      dot.addEventListener('click', function () {
        goToHeroSlide(index);
        startHeroAutoSlide();
      });
    });

    if (heroSection) {
      heroSection.addEventListener('mouseenter', stopHeroAutoSlide);
      heroSection.addEventListener('mouseleave', startHeroAutoSlide);
      // Touch events for mobile
      let touchStartX = 0;
      let touchEndX = 0;
      heroSection.addEventListener('touchstart', function(e) {
        touchStartX = e.changedTouches[0].screenX;
      }, { passive: true });
      heroSection.addEventListener('touchend', function(e) {
        touchEndX = e.changedTouches[0].screenX;
        if (touchEndX < touchStartX - 50) {
          nextHeroSlide(); // Swiped left
        } else if (touchEndX > touchStartX + 50) {
          const prevIndex = (currentHeroIndex - 1 + heroSlides.length) % heroSlides.length;
          goToHeroSlide(prevIndex); // Swiped right
        }
      }, { passive: true });
    }

    startHeroAutoSlide();
  }

  // 2. Horizontal Scroll for Services Carousel
  const servicesGrid = document.querySelector('.services-grid');
  const prevBtn = document.querySelector('.carousel-prev');
  const nextBtn = document.querySelector('.carousel-next');

  if (servicesGrid && prevBtn && nextBtn) {
    prevBtn.addEventListener('click', function () {
      servicesGrid.scrollBy({ left: -260, behavior: 'smooth' });
    });

    nextBtn.addEventListener('click', function () {
      servicesGrid.scrollBy({ left: 260, behavior: 'smooth' });
    });
  }

  // 3. Navigation Dropdowns & Mobile Drawer (Universal for Desktop, Touch & Mobile)
  const navMenu = document.querySelector('.nav-menu');
  const mobileToggle = document.querySelector('.mobile-toggle');

  if (navMenu) {
    const dropdowns = navMenu.querySelectorAll('.dropdown');

    dropdowns.forEach(dd => {
      const toggleLink = dd.querySelector('.dropdown-toggle');
      if (toggleLink) {
        toggleLink.setAttribute('aria-haspopup', 'true');
        toggleLink.setAttribute('aria-expanded', 'false');

        toggleLink.addEventListener('click', function (e) {
          e.preventDefault();
          e.stopPropagation();

          const isMobile = window.innerWidth <= 992;
          const openClass = isMobile ? 'mobile-open' : 'active';
          const wasOpen = dd.classList.contains(openClass);

          // Close all other open dropdowns first
          dropdowns.forEach(otherDd => {
            if (otherDd !== dd) {
              otherDd.classList.remove('active', 'mobile-open');
              const otherToggle = otherDd.querySelector('.dropdown-toggle');
              if (otherToggle) otherToggle.setAttribute('aria-expanded', 'false');
            }
          });

          // Toggle current dropdown
          if (!wasOpen) {
            dd.classList.add(openClass);
            toggleLink.setAttribute('aria-expanded', 'true');
          } else {
            dd.classList.remove(openClass);
            toggleLink.setAttribute('aria-expanded', 'false');
          }
        });
      }

      // Close dropdown when a child submenu link is clicked
      const subLinks = dd.querySelectorAll('.dropdown-menu a');
      subLinks.forEach(link => {
        link.addEventListener('click', function () {
          dd.classList.remove('active', 'mobile-open');
          if (toggleLink) toggleLink.setAttribute('aria-expanded', 'false');
          if (navMenu.classList.contains('mobile-active')) {
            navMenu.classList.remove('mobile-active');
          }
        });
      });
    });

    // Close any open dropdown or mobile drawer when clicking outside
    document.addEventListener('click', function (e) {
      if (!navMenu.contains(e.target) && (!mobileToggle || !mobileToggle.contains(e.target))) {
        dropdowns.forEach(dd => {
          dd.classList.remove('active', 'mobile-open');
          const toggleLink = dd.querySelector('.dropdown-toggle');
          if (toggleLink) toggleLink.setAttribute('aria-expanded', 'false');
        });
        if (navMenu.classList.contains('mobile-active')) {
          navMenu.classList.remove('mobile-active');
        }
      }
    });

    // Close dropdowns on Escape key
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') {
        dropdowns.forEach(dd => {
          dd.classList.remove('active', 'mobile-open');
          const toggleLink = dd.querySelector('.dropdown-toggle');
          if (toggleLink) toggleLink.setAttribute('aria-expanded', 'false');
        });
        if (navMenu.classList.contains('mobile-active')) {
          navMenu.classList.remove('mobile-active');
        }
      }
    });

    // Mobile Toggle button
    if (mobileToggle) {
      mobileToggle.addEventListener('click', function (e) {
        e.stopPropagation();
        navMenu.classList.toggle('mobile-active');
      });
    }

    // Close mobile menu on resize to desktop
    window.addEventListener('resize', function () {
      if (window.innerWidth > 992) {
        if (navMenu.classList.contains('mobile-active')) {
          navMenu.classList.remove('mobile-active');
        }
        dropdowns.forEach(dd => dd.classList.remove('mobile-open'));
      }
    });
  }

  // 4. Modal Dialog Management (Booking & Prescription Refill)
  const bookingModal = document.getElementById('bookingModal');
  const prescriptionModal = document.getElementById('prescriptionModal');
  const contactModal = document.getElementById('contactModal');

  window.openBookingModal = function (serviceType) {
    if (bookingModal) {
      if (serviceType) {
        const ddl = document.getElementById('ddlServiceType') || document.querySelector('[id$="ddlServiceType"]');
        if (ddl) {
          // Attempt exact value match or partial match
          for (let i = 0; i < ddl.options.length; i++) {
            if (ddl.options[i].value === serviceType || ddl.options[i].text.toLowerCase().includes(serviceType.toLowerCase())) {
              ddl.selectedIndex = i;
              break;
            }
          }
        }
      }
      bookingModal.classList.add('active');
      document.body.style.overflow = 'hidden';
    }
  };

  window.closeBookingModal = function () {
    if (bookingModal) {
      bookingModal.classList.remove('active');
      document.body.style.overflow = '';
    }
  };

  window.openPrescriptionModal = function () {
    if (prescriptionModal) {
      prescriptionModal.classList.add('active');
      document.body.style.overflow = 'hidden';
    }
  };

  window.closePrescriptionModal = function () {
    if (prescriptionModal) {
      prescriptionModal.classList.remove('active');
      document.body.style.overflow = '';
    }
  };

  window.openContactModal = function () {
    if (contactModal) {
      contactModal.classList.add('active');
      document.body.style.overflow = 'hidden';
    }
  };

  window.closeContactModal = function () {
    if (contactModal) {
      contactModal.classList.remove('active');
      document.body.style.overflow = '';
    }
  };

  // Close modals when clicking backdrop overlay
  document.querySelectorAll('.modal-overlay').forEach(overlay => {
    overlay.addEventListener('click', function (e) {
      if (e.target === overlay) {
        overlay.classList.remove('active');
        document.body.style.overflow = '';
      }
    });
  });

  // Close modals on Escape key
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') {
      closeBookingModal();
      closePrescriptionModal();
      closeContactModal();
    }
  });

  // 5. Smooth Scroll for in-page anchors
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      const targetId = this.getAttribute('href');
      if (targetId && targetId !== '#' && targetId.length > 1) {
        const targetElement = document.querySelector(targetId);
        if (targetElement) {
          e.preventDefault();
          if (navMenu && navMenu.classList.contains('mobile-active')) {
            navMenu.classList.remove('mobile-active');
          }
          targetElement.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
      }
    });
  });

});
