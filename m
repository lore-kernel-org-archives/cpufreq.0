From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH] Make PowerTOP generic, by removing hard coded values
Date: Wed, 25 Aug 2010 16:20:08 +0200
Message-ID: <201008251620.09154.trenn@suse.de>
References: <1281684356-7454-1-git-send-email-amit.arora@linaro.org> <AANLkTimdmQd8m30KuDBMqmXBsjW0zDY9uYpHoXQrJn=L@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <AANLkTimdmQd8m30KuDBMqmXBsjW0zDY9uYpHoXQrJn=L@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: power@bughost.org, cpufreq@vger.kernel.org
Cc: Amit Arora <amit.arora@linaro.org>, auke@linux.intel.com, amit.kucheria@linaro.org, yong.shen@linaro.org, vishwanath.bs@ti.com

On Tuesday 24 August 2010 12:58:41 Amit Arora wrote:
> Hello Auke,
> 
> Could you please look at this patch and provide your feedback ? 
> Thanks!
While this is probably needed for your purposes for a shortterm 
solution, I hope powertop can link against cpufrequtils library in the 
future to fetch general cpu freq info.
cpufrequtils is well maintained by one of the cpufreq kernel authors
and should be available on every distro for quite some time.

When I looked at this, I realized that this is perfect for using 
cpufreqlib and I wrote a patch making use of it.
I'll send 3 patches.
The first 2, I'd like to see getting applied, the third isn't that much
of use, but also an improvement.

There also was the discussion about cleaner sysfs access for pci stuff
(instead of lspci external binary executions and similar).
It would also be nice to see libpci getting used instead of 
reimplementing its functionality.

Amit: Your problem seem not to be the 16 static freqs, oldfreqs, delta
arrays, but that only 6 frequencies max are displayed?:

char cpufreqstrings[6][80];
...
if (maxfreq>4)
	maxfreq=4;
which should limit the frequency information string to 6 lines.
This you should have to touch?
On the other hand side there already is sorting for most relevant/mostly
used frequencies and only these are cut out. So if you have 16 (or do 
you really have more?) frequencies you should see the 6 mostly used 
ones, which sounds sane -> display size is limited.

Thanks,

    Thomas

> Regards,
> Amit Arora
> 
> On Fri, Aug 13, 2010 at 12:55 PM, Amit Arora <amit.arora@linaro.org>
> wrote:
> > Background:
> > Currently, PowerTOP has hard coded values for the number of C and P
> > states supported. Hence it doesn't work well on systems which may
> > have more states than these hard coded ones. This is specially true
> > for some of the ARM SoCs which may have as many as 8 to 9 C-states.
> >
> > Suggested fix:
> > This patch defines MAX values of C and P states for allocating
> > enough memory for data structures statically. But, uses actual
> > values of the MAX C and P states for display (using, maxcstate and
> > maxpstate variables).
...
