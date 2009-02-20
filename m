From: Joerg Platte <jplatte@naasa.net>
Subject: Re: cpuinfo shows wrong MHz value
Date: Fri, 20 Feb 2009 19:42:00 +0100
Message-ID: <200902201942.01681.jplatte@naasa.net>
References: <200902142217.51655.jplatte@naasa.net> <200902191803.55347.jplatte@naasa.net> <200902200352.51173.elendil@planet.nl>
Reply-To: jplatte@naasa.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754745AbZBTSmU@vger.kernel.org>
In-Reply-To: <200902200352.51173.elendil@planet.nl>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Frans Pop <elendil@planet.nl>
Cc: Kasper Sandberg <lkml@metanurb.dk>, linux-kernel@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Matthias-Christian Ott <ott@mirix.org>, cpufreq <cpufreq@www.linux.org.uk>

Am Freitag, 20. Februar 2009 schrieb Frans Pop:

> It looks as if http://bugzilla.kernel.org/10968 has a fix for this is=
sue,
> but that that patch never got included in the kernel.

Yes, this patch fixes the issue and the patch still applies to kernel=20
2.6.28.6. Please push it into mainline.

regards and many thanks for providing this patch,
J=C3=B6rg
