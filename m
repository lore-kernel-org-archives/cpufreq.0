From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [cpupower] RFC: support "cpupower subcommand [ -c cpulist ]"
Date: Wed, 10 Aug 2011 13:27:20 +0200
Message-ID: <20110810112720.GA4649@isilmar-3.linta.de>
References: <20110806151829.GA8559@comet.dominikbrodowski.net> <201108100900.12243.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201108100900.12243.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org

On Wed, Aug 10, 2011 at 09:00:11AM +0200, Thomas Renninger wrote:
> On Saturday 06 August 2011 17:18:29 Dominik Brodowski wrote:
> > Currently, one needs to set the cpulist _before_ the subcommand, i.e.
> > 
> > 	cpupower [ -c cpulist ] subcommand [ARGS]
> > 
> > However, cpufrequtils used to allow to have "-c CPU" as a parameter to
> > cpufreq-set(1) or cpufreq-info(1). Therefore, it may make sense to also
> > support
> Why exactly would this be an enhancement?
> To be able to create an alias easier?

Exactly. Also, 
	$ cpufreq-set -c 0 -g powersave
would translate more intuitively to
	$ cpupower frequency-set -c 0 g powersave

> > 	cpupower subcommand [ARGS#1] [ -c cpulist ] [ARGS#2]
> > 
> > The attached patch attempts to do so, but I'm not yet 100% convinced myself
> > that a) we should do this at all, and b) that I chose the right approach.
> I'd not try to do that.

Best,
	Dominik
