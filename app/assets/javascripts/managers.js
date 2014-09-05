// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function get_country_data(doc)
{
  if( doc == "" )
  {
    document.getElementById("info").innerHTML = " ";  
    return;
  }

	document.getElementById("info").innerHTML =
		$.ajax({
			url: "/application/get_country_data?doc=" + doc,
			async: false}).responseText;
}
