function initializeSlick() {
    $('.products-slick').each(function () {
      var $this = $(this),
          $nav = $this.attr('data-nav');
  
      $this.slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        infinite: true,
        speed: 300,
        dots: false,
        arrows: true,
        appendArrows: $nav ? $nav : false,
        responsive: [
          {
            breakpoint: 991,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 1
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
        ]
      });
    });

    // Reinitialize slick for widget sliders
$('.products-widget-slick').each(function () {
    var $this = $(this),
        $nav = $this.attr('data-nav');
  
    $this.slick({
      infinite: true,
      autoplay: true,
      speed: 50,
      dots: false,
      arrows: true,
      appendArrows: $nav ? $nav : false,
    });
  });
  
  }
  
  function loadPage(page) {
    fetch(`frontend/views/${page}.html`)
      .then(response => {
        if (!response.ok) {
          throw new Error(`Page not found: ${page}`);
        }
        return response.text();
      })
      .then(html => {
        document.getElementById("content").innerHTML = html;
  
        // Update body class
        document.body.className = (page === "login" || page === "register") ? "auth-page" : "main-page";
  
        // Set active nav
        document.querySelectorAll(".main-nav li").forEach(li => li.classList.remove("active"));
        const activeNav = document.getElementById(`nav-${page}`);
        if (activeNav) {
          activeNav.classList.add("active");
        }
  
        // Initialize slick only on home page
        if (page === "home") {
          initializeSlick();
        }
      })
      .catch(error => {
        console.error("Error loading page:", error);
        document.getElementById("content").innerHTML = "<h2>Page not found.</h2>";
      });
  }
  
  // Load correct page on refresh
  window.onload = function () {
    let page = window.location.hash.substring(1) || "home";
    loadPage(page);
  };
  