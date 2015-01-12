From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] input: CPU frequency booster
Date: Mon, 12 Jan 2015 14:32:48 +0100
Message-ID: <20150112133248.GC15838@amd>
References: <1326977615-4387-1-git-send-email-amiettinen@nvidia.com>
 <201201192353.00761.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201201192353.00761.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: Antti P Miettinen <amiettinen@nvidia.com>, davej@redhat.com, rjw@sisk.pl, len.brown@intel.com, khilman@ti.com, j-pihet@ti.com, markgross@thegnar.org, cpufreq@vger.kernel.org, linux-pm@lists.linux-foundation.org

Hi!

> I can't see why pm_qos is needed at all, better use cpufreq
> providing interface.
> PPC (BIOS request to cut max_frequency) in
> drivers/acpi/processor_perflib.c is a nice example
> 
> I'd also put this into drivers/cpufreq/cpufreq_input_boost.c.
> 
> Find below a re-written version of the booster.
> Instead of pm_qos, it simply uses cpufreq interface:
> /sys/devices/system/cpu/cpufreq/input_boost_freq
> /sys/devices/system/cpu/cpufreq/input_boost_time
> 
> I started with global cpufreq variables, they could also
> be declared per cpu like scaling_min_freq or others
> (at least input_boost_freq, input_boost_time should probably
> stay global). That would be:
> /sys/devices/system/cpu/cpuX/cpufreq/input_boost_freq

Going through old mails. This did not seem to go anywhere? Is it still
required? I don't see it in kernel. For some reason, it looks like it
has potential to help Nokia N900 a lot...
								Pavel
								
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
