{% with m.rsc[user_id] as r %}

{% wire id=#form type="submit" postback={recipient_add id=id in_admin=in_admin} delegate=delegate %}

<form id="{{ #form }}" method="post" action="postback">

<div class="form-item clearfix">
	<div class="zp-60">
		<label for="{{ #email }}">e-Mail</label>
		<input type="text" id="{{ #email }}" name="email" value="{{ r.email|escape }}" />
		{% validate id=#email name="email" type={presence} type={email} %}
	</div>
</div>

<div class="form-item clearfix">
	<div class="zp-30">
		<div class="form-item clearfix">
			<label for="{{ #name_first }}">First name</label>
			<input id="{{ #name_first }}" type="text" name="name_first" value="{{ r.name_first }}" style="width: 90%;" />
		</div>
	</div>

	<div class="zp-15">
		<div class="form-item clearfix">
			<label for="{{ #name_surname_prefix }}">Prefix</label>
			<input id="{{ #name_surname_prefix }}" type="text" name="name_surname_prefix" value="{{ r.name_surname_prefix }}" style="width: 50%" />
		</div>
	</div>

	<div class="zp-55">
		<div class="form-item clearfix">
			<label for="{{ #name_surname }}">Surname</label>
			<input id="{{ #name_surname }}" type="text" name="name_surname" value="{{ r.name_surname }}" style="width: 90%" />
		</div>
	</div>
	
	{% if not in_admin %}
		{% validate id=#name_first name="name_first" type={presence} %}
		{% validate id=#name_surname name="name_surname" type={presence} %}
	{% endif %}

</div>

{% if in_admin %}
	<div class="form-item clearfix">
		<label for="{{ #welcome }}">Send welcome</label>
		<input type="checkbox" id="{{ #welcome }}" name="send_welcome" value="1" checked="checked" />
	</div>
{% endif %}

<div style="clear: both">
	{% button text="subscribe" %}
	
	{% if in_admin %}
		{% button text="cancel" action={dialog_close} %}
	{% endif %}
</div>

</form>

{% endwith %}
