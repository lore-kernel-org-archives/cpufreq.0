From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 5/5] cpupowerutils: Introduce -b/-t --boost/--turbo cpufreq-info param
Date: Tue, 5 Oct 2010 15:43:37 +0200
Message-ID: <201010051543.37759.trenn@suse.de>
References: <1286281394-14699-1-git-send-email-trenn@suse.de> <1286281394-14699-6-git-send-email-trenn@suse.de> <20101005132510.GD7433@kamineko.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20101005132510.GD7433@kamineko.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Mattia Dongili <malattia@linux.it>
Cc: cpufreq@vger.kernel.org, linux@dominikbrodowski.net, Borislav Petkov <borislav.petkov@amd.com>, Len Brown <len.brown@intel.com>

On Tuesday 05 October 2010 15:25:10 Mattia Dongili wrote:
> On Tue, Oct 05, 2010 at 02:23:14PM +0200, Thomas Renninger wrote:
> > Prints out this by default (also works with --cpu X param):
> >   Analyzing Boost Capabilities on CPU 0:
> >   Supported: yes
> >   Active: yes
> 
> It'd be nice to also have manpage updates with these additional
> options.
Yep.
As mentioned in the changelog some feedback how exactly disabling
boost mode on Intel works, would be great.
Code should be fine, but the specifics (disabled on one/all cores, etc.)
should get mentioned in a man page.

BTW: I forgot to close the file descriptor in patch 4/5 in:
get_cpu_info(..).

     Thomas
