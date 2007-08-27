;#	Realtime Preview plugin for MovableType w/ BigPAPI
;#		Original Copyright (c) 2006 Piroli YUKARINOMIYA
;#		Open MagicVox.net - http://www.magicvox.net/
;#		@see http://www.magicvox.net/archive/2006/02071650.php

;#	This code is released under the Artistic License.
;#	The terms of the Artistic License are described at
;#	http://www.perl.com/language/misc/Artistic.html

package MT::Plugin::RealtimePreview;
use strict;

use vars qw( $VERSION );
$VERSION = '1.20';

use base qw( MT::Plugin );
my $plugin = new MT::Plugin ({
		name => 'Realtime Preview',
		version => $VERSION,
		author_name => 'Piroli YUKARINOMIYA',
		author_link => 'http://www.magicvox.net/',
		doc_link => 'http://www.magicvox.net/archive/2006/02071650.php',
		description =>
				'Enable realtime previewing in editing the entry.<br />'.
				'You can get a good preview of the entry in realtime.',
});
MT->add_plugin ($plugin);

;### Callback register for BigPAPI
MT->add_callback ('bigpapi::template::edit_entry', 9, $plugin, \&realtime_preview);

;### Template register for MTRealtimePreview*
use MT::Template::Context;
MT::Template::Context->add_container_tag ('RealtimePreview' => \&tag_realtime_preview);
MT::Template::Context->add_tag ('RealtimePreviewID' => \&tag_realtime_preview_id);

sub instance { $plugin }


;# Preview the contents of the textarea that has IDs below in MovableType editing screen
my @preview_default = qw( title text text_more keywords excerpt );

;# Add prefix in creating ids for preview
my $id_prefix = 'rtpv_';


;### Customize the entry editing page of MovableType
use MT::Entry;
sub realtime_preview {
	my ($cb, $app, $template) = @_;
	my $q = $app->{'query'};
;#
	;# retrieve a url for previewing
	my $preview_url;
	$q && $q->param('blog_id')
		or return undef;# invalid blog_id
	if ($q->param('id') && (my $entry = MT::Entry->load ({
					'blog_id' => $q->param ('blog_id'), 'id' => $q->param ('id'), status => 2
			}))) {
		$preview_url = $entry->permalink (undef);# preview with current editing entry
	} elsif (($entry = MT::Entry->load (
					{'blog_id' => $q->param ('blog_id'), status => 2},
					{'sort' => 'created_on', direction => 'descend', limit => 1}
			))) {
		$preview_url = $entry->permalink (undef);# preview with the most recent published page
	} else {
		return undef;# there is no page previewed
	}

	;# previewed fields
	my $event_handlers;
	map { $event_handlers .= sprintf "\taddEventHandler ('%s', '%s%s');\n", $_, $id_prefix, $_ } @preview_default;
	$event_handlers ne ''
		or return undef;# there is no field previewed

	;# Add JavaScript codes
	my $old = <<HTML;
</head>
HTML
	my $add = <<HTML;
<script type="text/javascript">
var wndPreview = null;

// 06/06/14, transporting from MT::Util::html_text_transform, thx to Yamakawa
function convert_paras (text) {
	var paras = text.split (/\\r?\\n\\r?\\n/);
	for (var i in paras)
		if (! paras[i].match (/^<\\/?(?:h1|h2|h3|h4|h5|h6|table|ol|dl|ul|menu|dir|p|pre|center|form|fieldset|select|blockquote|address|div|hr)/))
			paras[i] = '<p>' + paras[i].replace (/\\r?\\n/g, '<br />\\n') + '</p>\\n';
	return paras.join ('\\n\\n');
}

function addEventHandler (src, target) {
	var txtarea = document.getElementById (src);
	if (txtarea)
		(txtarea.onchange = txtarea.onkeyup = txtarea.onfocus = function () {
			var u = wndPreview;
			if (! u || u.closed || ! (u = u.document))
				return;
			var text = txtarea.value;
			if (document.getElementById ('convert_breaks').options.selectedIndex)
				text = convert_paras (text);
			for (var v = 1, i = 1; u && v; i++)
				(v = u.getElementById (target + i)) && (v.innerHTML = text);
		}) ();
}

function checkPageLoaded () {
	var u;
	if ((u = wndPreview) && (! u.closed) && (u = u.document)
			&& (u = u.getElementsByTagName ('body'))
			&& u.length && (u = u[0]) && (u = u.lastChild))
	{
%%RTPREVIEW_EVENT_HANDLERS%%
		return;
	}
	setTimeout ("checkPageLoaded ()", 100);
}

function invokeRealtimePreview () {
	if (wndPreview && ! wndPreview.closed && wndPreview.document)
		wndPreview.focus ();
	else
		wndPreview = window.open ('%%RTPREVIEW_PREVIEW_URL%%');
	checkPageLoaded ();
}
</script>
HTML
	$add =~ s/%%RTPREVIEW_PREVIEW_URL%%/$preview_url/;
	$add =~ s/%%RTPREVIEW_EVENT_HANDLERS%%/$event_handlers/;

	$old = quotemeta ($old);
	$$template =~ s/($old)/$add$1/;	

	;# Add previewing button
	$old = <<HTML;
<input type="button" name="preview_entry" value="<MT_TRANS phrase="Preview">" accesskey="v" title="<MT_TRANS phrase="Preview this entry (p)">" onclick="submitForm(this.form, 'preview_entry')" />
HTML
	$add = <<HTML;
<input type="button" value="Realtime Preview" title="Do realtime previewing" onclick="invokeRealtimePreview ();" />
HTML
	$old = quotemeta ($old);
	$$template =~ s/($old)/$1$add/;	
}


;### Container tag to creat span element having the unique id.
sub tag_realtime_preview {
    my ($ctx, $args, $cond) = @_;
;#
	;# build contents within container tag
	defined (my $content = $ctx->stash('builder')->build ($ctx, $ctx->stash ('tokens')))
			or return $ctx->error ($ctx->errstr);
	if (my $field = $args->{field}) {
		$content = sprintf '<span id="%s">%s</span>', tag_realtime_preview_id ($ctx, $args), $content;
	}
	return $content;
}

;### Tag to get the unique id.
sub tag_realtime_preview_id {
    my ($ctx, $args) = @_;
;#
	if (my $field = $args->{field}) {
		return sprintf '%s%s%d', $id_prefix, $field, ++$ctx->{__stash}{__PACKAGE__. $field};
	}
	return '';
}

1;