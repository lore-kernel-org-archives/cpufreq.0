From: Anton Vorontsov <anton.vorontsov@linaro.org>
Subject: Re: [PATCH 3/4] cpufreq: New 'interactive' governor
Date: Thu, 9 Feb 2012 04:32:43 +0400
Message-ID: <20120209003243.GA24602@oksana.dev.rtsoft.ru>
References: <20120208013959.GA24535@panacea>
 <20120208014437.GC459@panacea>
 <CAKfTPtBgVy+CmNtbwetP1LRDusrUkHPXGPzNXwq2J13qOjtJ1Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKfTPtBgVy+CmNtbwetP1LRDusrUkHPXGPzNXwq2J13qOjtJ1Q@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Dave Jones <davej@redhat.com>, Russell King <linux@arm.linux.org.uk>, Oleg Nesterov <oleg@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Nicolas Pitre <nico@fluxnic.net>, Mike Chan <mike@android.com>, Todd Poynor <toddpoynor@google.com>, cpufreq@vger.kernel.org, kernel-team@android.com, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello Vincent,

On Wed, Feb 08, 2012 at 03:00:59PM -0800, Vincent Guittot wrote:
> Have you got some figures which shows the improvement of the
> responsivness compared to other governor like the ondemand one ?
> That could be interesting to test interactive governor with
> cpufreq-bench and compare the results with ondemand ?

I don't have any numbers handy, but no doubt the governor brings
some improvements which you can see on a real device.

Anyway, the point of sending out these RFC patches was to get a
technical review of the approach, because there's no much point
in pushing the code that isn't acceptable on technical merits,
no matter how better numbers it might give.

And scheduler folks aren't happy on the whole approach, so I
guess we should go back to the drawing board. :-)

Thanks,

p.s. Sure, in the end we'll have to measure 'interactive' vs.
'ondemand' vs. 'newapproach'. And maybe now it's time to actually
measure 'interactive' governor in numbers... I'll get back to
this thread when I get the numbers.

-- 
Anton Vorontsov
Email: cbouatmailru@gmail.com
