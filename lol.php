<form>
Name:<input type="text" />
<input type="submit" />
</form>

<table>
<tr>
<th>Name</th>
</tr>
// Here the name should be appended...within a <tr><td></td></tr>
</table>



$('form').on('submit', function (e) {
  e.preventDefault();
  var newName = $('form').find('input[type="text"]').val();
  $('table').append('<tr><td>' + newName + '</td></tr>')
});