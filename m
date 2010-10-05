From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 5/5] cpupowerutils: Introduce -b/-t --boost/--turbo
	cpufreq-info param
Date: Tue, 5 Oct 2010 16:52:32 +0200
Message-ID: <20101005145232.GA4523@isilmar-3.linta.de>
References: <1286281394-14699-1-git-send-email-trenn@suse.de> <1286281394-14699-6-git-send-email-trenn@suse.de> <20101005144717.GA20505@aftab>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101005144717.GA20505@aftab>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@amd64.org>
Cc: Thomas Renninger <trenn@suse.de>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Len Brown <len.brown@intel.com>

Hey,

On Tue, Oct 05, 2010 at 04:47:17PM +0200, Borislav Petkov wrote:
> From: Thomas Renninger <trenn@suse.de>
> Date: Tue, Oct 05, 2010 at 08:23:14AM -0400
> 
> > Prints out this by default (also works with --cpu X param):
> >   Analyzing Boost Capabilities on CPU 0:
> >   Supported: yes
> >   Active: yes
> 
> I think it would be simpler if you dump the boosting information in
> cpufreq-info, i.e. without an explicit --boost option or whatever.

Only works if you are root, AFAICS.

Best,
	Dominik
