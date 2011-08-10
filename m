From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [cpupower] RFC: use man(1) when calling "cpupower help
	subcommand"
Date: Wed, 10 Aug 2011 13:28:05 +0200
Message-ID: <20110810112805.GB4649@isilmar-3.linta.de>
References: <20110806161143.GA12443@comet.dominikbrodowski.net> <201108100853.54106.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201108100853.54106.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org

y
On Wed, Aug 10, 2011 at 08:53:53AM +0200, Thomas Renninger wrote:
> On Saturday 06 August 2011 18:11:43 Dominik Brodowski wrote:
> > Instead of printing something non-formatted to stdout, call
> > man(1) to show the man page for the proper subcommand.
> 
> Nice!
>   
> > -extern void set_help(void);
> > -extern void info_help(void);
> > -extern void freq_set_help(void);
> > -extern void freq_info_help(void);
> > -extern void idle_info_help(void);
> > -extern void monitor_help(void);
> I wonder whether these are still needed then.
> If they can get removed translations, maintenance overhead
> (adjusting 2 places when adding a parameter) and the size of the 
> binaries could get reduced.

That's enough material for a second patch, which cleans up the error paths
on invalid or insufficient parameters being passed to the (sub)commands.

Best,
	Dominik
