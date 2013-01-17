From: Elliot Wolk <elliot.wolk@gmail.com>
Subject: Re: [Bug 50721] CPU freqs stay stuck at max after reboot with on-demand governor set - i7-2630QM
Date: Thu, 17 Jan 2013 21:24:38 +0000 (UTC)
Message-ID: <loom.20130117T221016-208@post.gmane.org>
References: <bug-50721-12968@https.bugzilla.kernel.org/> <20130114013037.4480F11FB6C@bugzilla.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

i also experience this exactly, with i7-2720QM.
my cores get 'stuck' on 2.2ghz
sometimes, the max w/out turbo.
{kernel 3.7.0, lenovo w520}

cpu usage hovers around 6% and load is .62.
the cores spend nearly all their time in C7 state,
according to turbostat.

changing the governor does not fix this.
using userspace or ondemand and setting
the min/max can convince to use turbo {2201000, goes to 3.1ghz},
but not change the minimum.
performance makes it use turbo {goes to 3.1ghz},
and powersave does nothing {keeps it at 2.2ghz}.

note that suspending to ram and waking up,
occasionally shakes it loose, and freq drops to 0.8ghz.
so when it gets stuck, as a workaround, i just pm-suspend,
wait 20s, and repeat, until turbostat shows it has dropped.

