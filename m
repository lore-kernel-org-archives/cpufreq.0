From: Mattia Dongili <malattia@linux.it>
Subject: Re: CPU throttled down to 800 after 15-30mins
Date: Sun, 6 Feb 2011 13:41:23 +0900
Message-ID: <20110206044123.GB2703@kamineko.org>
References: <4D4DAB6A.6090807@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D4DAB6A.6090807@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: J Webster <jw.jwebster@gmail.com>
Cc: cpufreq@vger.kernel.org

Note that this is a kernel development related list, if your problem is
specific to cpufreqd (note the "d" for deamon, a userspace application)
please write/reply to me only or to cpufreqd related mailing lists.

On Sat, Feb 05, 2011 at 08:56:26PM +0100, J Webster wrote:
> My laptop is an Inpsiron 9300, which should be able to go up to 1.73GHz.
> I am having an issue whereby when I first turn the computer on,
> ondemand is selected and the speed moves between 800 and 1.73
> successfully.
> For no apparent reason, after 15mins it is throttled back to 800 and
> I cannot change it back.
> I tired manually editing the scaling_max_freq file to 1733000 but
> when I go back to view it it has changed to 800000 again!
> I thought it might be this issue:
> ##
> # Special Rules
> ##
> # CPU Too hot!
> [Rule]
> name=CPU Too Hot
> acpi_temperature=55-100
> cpu_interval=50-100
> profile=Performance Low
> [/Rule]
> 
> So I changed it from 70-100 but on the last try the cpu did  not
> reach 70 and it still throttled it back to 800.

Try to increase cpufreqd verbosity, it will tell you which and why a
specific rule was selected. From there you can work on modifying your
rules to better match your usage.

Regards,
-- 
mattia
:wq!
