From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [cpupower] RFC: support "cpupower subcommand [ -c cpulist ]"
Date: Mon, 15 Aug 2011 19:54:43 +0200
Message-ID: <20110815175443.GA24112@comet.dominikbrodowski.net>
References: <20110806151829.GA8559@comet.dominikbrodowski.net>
 <201108100900.12243.trenn@suse.de>
 <20110810112720.GA4649@isilmar-3.linta.de>
 <201108112348.41335.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201108112348.41335.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org

Hey,

On Thu, Aug 11, 2011 at 11:48:40PM +0200, Thomas Renninger wrote:
> On Wednesday 10 August 2011 13:27:20 Dominik Brodowski wrote:
> > On Wed, Aug 10, 2011 at 09:00:11AM +0200, Thomas Renninger wrote:
> > > On Saturday 06 August 2011 17:18:29 Dominik Brodowski wrote:
> > > > Currently, one needs to set the cpulist _before_ the subcommand, i.e.
> > > > 
> > > > 	cpupower [ -c cpulist ] subcommand [ARGS]
> > > > 
> > > > However, cpufrequtils used to allow to have "-c CPU" as a parameter to
> > > > cpufreq-set(1) or cpufreq-info(1). Therefore, it may make sense to also
> > > > support
> > > Why exactly would this be an enhancement?
> > > To be able to create an alias easier?
> > 
> > Exactly.
> 
> I also tried with "being able to do an alias" without success.
> One idea could be to re-implement -c evaluation in frequency_info.c
> BUT be aware that default switched:
>   - with cpufrequtils cpufreq-info by default showed all cpus
>   - with cpupower all read commands only show cpu 0 by default
> 
>   - with cpufrequtils cpufreq-set only sets the first cpu
>   - with cpupower all write commands write to all cpus
> and this is on purpose and should not change.
> So unfortunately an alias won't be possible.

Well, it wouldn't be a backwards-compatible alias. But still, might it be
worthwhile? What do you (and others reading this) think?

Best,
	Dominik

