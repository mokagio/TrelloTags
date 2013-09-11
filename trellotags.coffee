
# regex to find the words wrapped in {...}
reg = /\{(.*?)\}/g

$ ->
	$('.js-card-name').each () ->
		tags = $(this).html().replace(reg, '<span class="tt-tag">$1</span>')
		$(this).html(tags)
