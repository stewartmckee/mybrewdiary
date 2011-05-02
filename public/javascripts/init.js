$(document).ready(function(){
						   
	// Homepage Slideshow
	if ($('#slideshow').length > 0) {
		$('#slideshow').slidertron({
			viewerSelector:			'.viewer',
			reelSelector:			'.viewer .reel',
			slidesSelector:			'.viewer .reel .slide',
			navPreviousSelector:	'.previous',
			navNextSelector:		'.next',
			speed:					'slow'
		});
	}
	
	// Gallery Page
	if ($('#gallery').length > 0) {
		$.gallerax({
			outputSelector: 		'#gallery .output img',
			thumbnailsSelector:		'#gallery .thumbnails li img',
			captionSelector:		'#gallery .captions .line',
			captionLines:			2,
			fade: 					'slow',
			navNextSelector:		'#gallery .next',
			navPreviousSelector:	'#gallery .prev',
			thumbnailsFunction: 	function(s) { return s.replace(/_thumb\.jpg$/, '.jpg'); }
		});
	}

});
