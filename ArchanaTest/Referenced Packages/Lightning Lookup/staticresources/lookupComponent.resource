(function() {    
    $("input").focus(function() {        
		deleteTable();        
    });
})();

function setLookupValue(record, componentId) {
	document.getElementsByClassName(componentId)[0].value = record.getAttribute('recordname');
	document.getElementsByClassName(componentId + 'RecordId')[0].value = record.getAttribute('recordid');
	deleteTable(componentId);
	
	if ("createEvent" in document) {
		var evt = document.createEvent("HTMLEvents");
		evt.initEvent("change", false, true);
		document.getElementsByClassName(componentId + 'RecordId')[0].dispatchEvent(evt);
	} else {
		document.getElementsByClassName(componentId + 'RecordId')[0].fireEvent("onchange");
	}
	document.getElementsByClassName(componentId)[0].focus();
}

function deleteTable(componentId) {
	var x = document.getElementById(componentId + "lookupTable").rows.length;    
	for(var i = x; i > 0; i--) {
		document.getElementById(componentId + "lookupTable").deleteRow(i-1);
	}
}

function deleteTable() {
	var elements = document.getElementsByClassName("lookupTable");
	for(var index = elements.length; index > 0; index--) {
		var x = elements[index - 1].rows.length;    
		for(var i = x; i > 0; i--) {
			elements[index - 1].deleteRow(i-1);
		}
	}	
}