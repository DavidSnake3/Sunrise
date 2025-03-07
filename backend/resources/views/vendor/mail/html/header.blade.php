@props(['url'])
<tr>
<td class="header">
<a href="{{ $url }}" style="display: inline-block;">
@if (trim($slot) === 'Laravel')
<img src="https://i.imgur.com/2KiTrfX.png" class="logo" alt="Sunrise">
@else
{{ $slot }}
@endif
</a>
</td>
</tr>
