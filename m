From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: Possible SNB throttling erratum in need of workaround?
Date: Tue, 7 Jan 2014 14:02:49 -0800
Message-ID: <CALCETrX41X6ZbB-C1Y0V4Au9o6=p17aGo6NLMjxtEkRJQJHGgA@mail.gmail.com>
References: <CALCETrVmWAVwLtEbK0AZGBmcqUEkM_Zhz1WGSY5wSpLsaHiOkA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CALCETrVmWAVwLtEbK0AZGBmcqUEkM_Zhz1WGSY5wSpLsaHiOkA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: cpufreq@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>

[cc: some more people]

On Wed, Dec 18, 2013 at 6:02 PM, Andy Lutomirski <luto@amacapital.net> wrote:
> I have a box running 3.9.4.  For a few hundred ms, all packages and
> cores* exceeded their power limits, and then they all came back to
> normal.
>
> Since then, turbo boost went away.
>
> The first thing I tried was writing 0 to msr 0x19C to clear the
> throttling "log" bit.  The bit was clear, but still no turbo.  (I only
> did this on one package to avoid destroying information.)
>
> I have the performance governor set, so there are never any
> software-initiated performance transitions.  As an experiment, I
> switched core 0 to powersave (aka very low frequency) and then back to
> performance.  The entire package's turbo came back.  I did the same
> thing to the cores on package 1 (all of them, sorry), and that
> package's turbo boost came back.
>
> Does the kernel need to reprogram CPU frequencies after thermal/power
> throttling conditions clear?
>
> My CPUs are:
>
> processor       : 31
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 45
> model name      : Intel(R) Xeon(R) CPU E5-2690 0 @ 2.90GHz
> stepping        : 7
> microcode       : 0x710
>
>
> * Slight lie here.  CPU18 exceeded core limit but not power limit.

I got another power-limit-exceeded warning, but this one didn't kill Turbo.

This problem might be more widespread than people would notice,
because the log line was removed by:

commit c81147483e525e4a471d581877d7d634591246e1
Author: Fenghua Yu <fenghua.yu@intel.com>
Date:   Tue May 21 15:35:16 2013 -0400

    x86 thermal: Delete power-limit-notification console messages

and if the only symptom is that, under certain workloads, turbo goes
away until the system is rebooted or cpufreq is manually twiddled,
people might not notice.

--Andy
