From: Anton Vorontsov <anton.vorontsov@linaro.org>
Subject: [PATCH RFC 0/4] Scheduler idle notifiers and users
Date: Wed, 8 Feb 2012 05:39:59 +0400
Message-ID: <20120208013959.GA24535@panacea>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Dave Jones <davej@redhat.com>, Russell King <linux@arm.linux.org.uk>
Cc: Oleg Nesterov <oleg@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Nicolas Pitre <nico@fluxnic.net>, Mike Chan <mike@android.com>, Todd Poynor <toddpoynor@google.com>, cpufreq@vger.kernel.org, kernel-team@android.com, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hi all,

For some drivers we need to know when scheduler is idling. The most
straightforward way is to gracefully hook into the idle loop.

On x86 there are "CPU idle" notifiers in the inner idle loop, but
scheduler idle notifiers are different. These notifiers do not run on
every invocation/exit from cpuidle, instead they used to notify about
scheduler state changes, not HW states.

In other words, CPU idle notifiers work inside while(!need_resched())
loop (nested into idle loop), while scheduler idle notifier work
outside of the loop.

The first two patches consolidate scheduler idle entry/exit
points, and converts architectures to this new API.

The third patch is a new cpufreq governor, the commit message
briefly describes it.

The fourth patch is another user of the notifiers, a trivial one.

Thanks,

p.s. For the reference, the old discussion about CPU/PM idle
     notifiers: http://lkml.org/lkml/2011/6/27/391 

-- 
Anton Vorontsov
Email: cbouatmailru@gmail.com
