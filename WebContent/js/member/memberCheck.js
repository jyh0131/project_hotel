/**
 * 
 */
function checkInputEmpty($objs) {
	var count = 0;
	$objs.each(function(i, obj) {
		if ($(obj).val() == "") {
			$(obj).next().css("display", "inline");
			count++;
		}
	})
	if (count > 0) {
		return false;
	}
	return true;
}