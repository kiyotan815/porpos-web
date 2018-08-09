jQuery(function($) {
	$('.bg-slider').bgSwitcher({
			images: ['<%= asset_path 'home1.jpg' %>', '<%= asset_path 'home2.jpg' %>', '<%= asset_path 'home3.jpg' %>',
							 '<%= asset_path 'home5.jpg' %>'],
			interval: 5000,
			shuffle: true,
			effect: "fade"
	});
});
