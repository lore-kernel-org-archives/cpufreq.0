From: Thomas Renninger <trenn@suse.de>
Subject: Re: CPU throttled down to 800 after 15-30mins
Date: Mon, 7 Feb 2011 20:55:38 +0100
Message-ID: <201102072055.38707.trenn@suse.de>
References: <4D4DAB6A.6090807@gmail.com> <20110206044123.GB2703@kamineko.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110206044123.GB2703@kamineko.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Mattia Dongili <malattia@linux.it>
Cc: J Webster <jw.jwebster@gmail.com>, cpufreq@vger.kernel.org

On Sunday 06 February 2011 05:41:23 Mattia Dongili wrote:
> Note that this is a kernel development related list, if your problem is
> specific to cpufreqd (note the "d" for deamon, a userspace application)
> please write/reply to me only or to cpufreqd related mailing lists.
> 
> On Sat, Feb 05, 2011 at 08:56:26PM +0100, J Webster wrote:
> > My laptop is an Inpsiron 9300, which should be able to go up to 1.73GHz.
> > I am having an issue whereby when I first turn the computer on,
> > ondemand is selected and the speed moves between 800 and 1.73
> > successfully.
> > For no apparent reason, after 15mins it is throttled back to 800 and
> > I cannot change it back.
> > I tired manually editing the scaling_max_freq file to 1733000 but
> > when I go back to view it it has changed to 800000 again!
> > I thought it might be this issue:
> > ##
> > # Special Rules
> > ##
> > # CPU Too hot!
> > [Rule]
> > name=CPU Too Hot
> > acpi_temperature=55-100
> > cpu_interval=50-100
> > profile=Performance Low
> > [/Rule]
> > 
> > So I changed it from 70-100 but on the last try the cpu did  not
> > reach 70 and it still throttled it back to 800.
> 
> Try to increase cpufreqd verbosity, it will tell you which and why a
> specific rule was selected. From there you can work on modifying your
> rules to better match your usage.
Also check whether your BIOS is the reason, if you get 800000 here:
/sys/devices/system/cpu/cpu0/cpufreq/bios_limit
you should check your BIOS settings.

       Thomas
