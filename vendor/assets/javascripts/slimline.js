if (window.addEventListener &&
    window.requestAnimationFrame &&
    document.getElementsByClassName) {
  window.addEventListener('load', function() {
    var pItem = document.querySelectorAll('[data-slimline]'), pCount, timer;

    window.addEventListener('scroll', scroller, false);
    window.addEventListener('resize', scroller, false);


  // DOM mutation observer
  if (MutationObserver) {
    var observer = new MutationObserver(function() {
      if (pItem.length !== pCount) inView();
    });
    observer.observe(document.body, { subtree: true, childList: true, attributes: true, characterData: true });
  }

    // initial check
    inView();

    // throttled scroll/resize
    function scroller() {
      timer = timer || setTimeout(function() {
        timer = null;
        inView();
      }, 300);
    }

    function inView() {
      console.log(pItem, pItem.length)
      if (pItem.length) requestAnimationFrame(function() {
        var wT = window.pageYOffset, wB = wT + window.innerHeight, cRect, pT, pB, p = 0;
        while (p < pItem.length) {
          cRect = pItem[p].getBoundingClientRect();
          pT = wT + cRect.top;
          pB = pT + cRect.height;

          if (wT < pB && wB > pT) {
            loadFullImage(pItem[p]);
          }
          else p++;
        }
        pCount = pItem.length;
      });
    }

    function loadFullImage(item) {
      var fullImg = item.getAttribute('data-full-image');
      var img = new Image();
      img.src = fullImg;
      img.className = 'reveal';
      if (img.complete) addImg();
      else img.onload = addImg;
      console.log("gete");

      // replace image
      function addImg() {

        requestAnimationFrame(function() {

          // preview image
          var pImg = item.src

          // add full image
          item.insertBefore(img).addEventListener('animationend', function() {
            // remove preview image
            if (item) {
              img.alt = item.alt || '';
              item.parentNode.removeChild(item);
            }
          });

        });
      }
    }
  }, false);
}


