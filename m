From: Borislav Petkov <bp@amd64.org>
Subject: Re: [PATCH 5/5] cpupowerutils: Introduce -b/-t --boost/--turbo
 cpufreq-info param
Date: Tue, 5 Oct 2010 17:10:51 +0200
Message-ID: <20101005151051.GC20505@aftab>
References: <1286281394-14699-1-git-send-email-trenn@suse.de>
 <1286281394-14699-6-git-send-email-trenn@suse.de>
 <20101005144717.GA20505@aftab>
 <20101005145232.GA4523@isilmar-3.linta.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101005145232.GA4523@isilmar-3.linta.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Thomas Renninger <trenn@suse.de>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Len Brown <len.brown@intel.com>

From: Dominik Brodowski <linux@dominikbrodowski.net>
Date: Tue, Oct 05, 2010 at 10:52:32AM -0400

Hi Dominik,

> > > Prints out this by default (also works with --cpu X param):
> > >   Analyzing Boost Capabilities on CPU 0:
> > >   Supported: yes
> > >   Active: yes
> > 
> > I think it would be simpler if you dump the boosting information in
> > cpufreq-info, i.e. without an explicit --boost option or whatever.
> 
> Only works if you are root, AFAICS.

true, it depends on the /dev/cpu/<NUM>/msr permissions and those should
be root:root.

Ok then, we could concentrate the boosting in the cpufreq-set command
which should check for the calling user id being root or similar:

cpufreq-set --boost (on|off) - toggles boosting
cpufreq-set --boost - without an option could dump the current boosting setting.

This is much more intuitive IMHO.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Gemeinde Aschheim, Landkreis Muenchen
Registergericht Muenchen, HRB Nr. 43632
