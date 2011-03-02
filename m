From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [2.6.38-rc7, patch] cpuinfo_cur_freq unreadable by non-root
Date: Wed, 2 Mar 2011 11:30:30 +0100
Message-ID: <20110302103030.GA16727@isilmar-3.linta.de>
References: <AANLkTikhgKn9ZCqUXP-K2CtSSTiJ_=tXuhF_t7Rbqgdx@mail.gmail.com> <201103021027.38810.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201103021027.38810.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: Daniel J Blueman <daniel.blueman@gmail.com>, cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>

Hey,

On Wed, Mar 02, 2011 at 10:27:38AM +0100, Thomas Renninger wrote:
> > -cpufreq_freq_attr_ro_perm(cpuinfo_cur_freq, 0400);
> > +cpufreq_freq_attr_ro(cpuinfo_cur_freq);
> >  cpufreq_freq_attr_ro(cpuinfo_min_freq);
> Having this read only for root goes back to the beginning
> of git history of this file in 2005...
> It looks like this is done on purpose, but I do not see why
> this should not be readable for others.
> 
> Maybe Dominik or Dave have an idea.

This talks to hardware, and might (in some implementations) talk to the
BIOS, causing it to do nasty things, such as executing things in SMM. That
shouldn't be available to the world. However, as ACPI still does not provide
a ->get() method, making this attribute world readable _might_ not cause too
much harm, but it isn't worth the hassle IMO. Especially as everyone may
read out scaling_cur_freq, and scaling_cur_freq differs from
cpuinfo_cur_freq _only_ if something is broken.

Best,
	Dominik
