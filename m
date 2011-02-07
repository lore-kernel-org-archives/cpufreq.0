From: Mattia Dongili <malattia@linux.it>
Subject: Re: CPU throttled down to 800 after 15-30mins
Date: Tue, 8 Feb 2011 06:41:51 +0900
Message-ID: <20110207214151.GC18545@kamineko.org>
References: <4D4DAB6A.6090807@gmail.com>
 <20110206044123.GB2703@kamineko.org>
 <201102072055.38707.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201102072055.38707.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: J Webster <jw.jwebster@gmail.com>, cpufreq@vger.kernel.org

On Mon, Feb 07, 2011 at 08:55:38PM +0100, Thomas Renninger wrote:
> On Sunday 06 February 2011 05:41:23 Mattia Dongili wrote:
...
> > > So I changed it from 70-100 but on the last try the cpu did  not
> > > reach 70 and it still throttled it back to 800.
> > 
> > Try to increase cpufreqd verbosity, it will tell you which and why a
> > specific rule was selected. From there you can work on modifying your
> > rules to better match your usage.
> Also check whether your BIOS is the reason, if you get 800000 here:
> /sys/devices/system/cpu/cpu0/cpufreq/bios_limit
> you should check your BIOS settings.

Good catch, after a bit of private chatting it turns out that the BIOS
may be the reason why frequency is locked at 800MHz

-- 
mattia
:wq!
