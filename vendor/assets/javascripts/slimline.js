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
      }, 500);
    }

    function inView() {
      if (pItem && pItem.length) {
        var wT = window.pageYOffset, wB = wT + window.innerHeight, cRect, pT, pB, p = 0;
        while (p < pItem.length) {
          cRect = pItem[p].getBoundingClientRect();
          pT = wT + cRect.top;
          pB = pT + cRect.height;

          if (wT < pB && wB > pT) {
            loadFullImage(pItem[p]);
          }
          p++;
        }
        pCount = pItem.length;
      };
    }

    function loadFullImage(item) {

      var fullImg = item.getAttribute('data-full-image');
      if (!fullImg || !item) return;
      var img = new Image();
      img.src = fullImg;
      if (img.complete) addImg();
      else img.onload = addImg;

      // replace image
      function addImg() {
        // add full image
        item.parentNode.insertBefore(img, item);
        // remove preview image
        if (item) {
          img.alt = item.alt || '';
          img.width = item.width;
          item.parentNode.removeChild(item);
        };
    }
    }
  }, false);
}


