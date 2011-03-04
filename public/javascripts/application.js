// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function split(val) {
	return val.split(/,\s*/);
}

function extractLast(term) {
	return split(term).pop();
}

function setupAutocomplete(element, url) {
	$(element).autocomplete({
		source: function(request, response) {
			$.getJSON(url, {
				term: extractLast(request.term)
			}, response);
		},
		search: function() {
			// custom minLength
			var term = extractLast(this.value);
		},
		focus: function() {
			// prevent value inserted on focus
			return false;
		},
		select: function(event, ui) {
			var terms = split( this.value );
			// remove the current input
			terms.pop();
			// add the selected item
			terms.push(ui.item.value);
			// add placeholder to get the comma-and-space at the end
			terms.push("");
			this.value = terms.join(", ");
			return false;
		}
	});
}

$(document).ready(function(){
	
	setupAutocomplete(".tag-select", "/tags.json")
	
})