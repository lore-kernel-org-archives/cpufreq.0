From: Frans Pop <elendil@planet.nl>
Subject: Re: cpuinfo shows wrong MHz value
Date: Fri, 20 Feb 2009 03:52:50 +0100
Message-ID: <200902200352.51173.elendil@planet.nl>
References: <200902142217.51655.jplatte@naasa.net> <200902182205.47737.elendil@planet.nl> <200902191803.55347.jplatte@naasa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755017AbZBTCxI@vger.kernel.org>
In-Reply-To: <200902191803.55347.jplatte@naasa.net>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jplatte@naasa.net
Cc: Kasper Sandberg <lkml@metanurb.dk>, linux-kernel@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Matthias-Christian Ott <ott@mirix.org>, cpufreq <cpufreq@www.linux.org.uk>

On Thursday 19 February 2009, Joerg Platte wrote:
> Am Mittwoch, 18. Februar 2009 schrieb Frans Pop:
> > commit ed9cbcd40004904dbe61ccc16d6106a7de38c998
> > Author: Zhao Yakui <yakui.zhao@intel.com>
> > Date:   Tue Nov 20 14:20:21 2007 -0500
> >     Revert "speedstep-lib.c: fix frequency multiplier for Pentium4
> > models 0&1"
> >
> > That would exactly explain the factor 8 of the error.
>
> Yes, looks like thats the reason.

It looks as if http://bugzilla.kernel.org/10968 has a fix for this issue, 
but that that patch never got included in the kernel.

For start of current thread, see: 
http://www.gossamer-threads.com/lists/linux/kernel/1034291?page=last
