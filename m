From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [PATCH RFC 0/4] Scheduler idle notifiers and users
Date: Tue, 21 Feb 2012 14:38:28 +0200
Message-ID: <69B0D95C-2A80-41A9-97E1-86F5840B84CF@antoniou-consulting.com>
References: <20120208013959.GA24535@panacea> <1328670355.2482.68.camel@laptop>
 <20120208202314.GA28290@redhat.com> <1328736834.2903.33.camel@pasglop>
 <20120209075106.GB18387@elte.hu> <4F35DD3E.4020406@codeaurora.org>
 <20120211144530.GA497@elte.hu> <4F3AEC4E.9000303@codeaurora.org>
 <1329313085.2293.106.camel@twins>
 <20120215140245.GB27825@n2100.arm.linux.org.uk>
 <1329318063.2293.136.camel@twins>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1329318063.2293.136.camel@twins>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: linaro-kernel@lists.linaro.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Nicolas Pitre <nico@fluxnic.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Oleg Nesterov <oleg@redhat.com>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Anton Vorontsov <anton.vorontsov@linaro.org>, Todd Poynor <toddpoynor@google.com>, Saravana Kannan <skannan@codeaurora.org>, Mike Chan <mike@android.com>, Dave Jones <davej@redhat.com>, Ingo Molnar <mingo@elte.hu>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, kernel-team@android.com, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Arjan Van De Ven <arjan@infradead.org>

Hi there,

On Feb 15, 2012, at 5:01 PM, Peter Zijlstra wrote:

> On Wed, 2012-02-15 at 14:02 +0000, Russell King - ARM Linux wrote:
> 

<snip>
> 
> I guess that all will depend on the hardware.. there'll still be some
> sort of governor in between taking the per-cpu/task load-tracking data
> and scheduler events and using that to compute some volt/freq setting.
> 
> From what I've heard there's a number of different classes of hardware
> out there, some like race to idle, some can power gate more than others
> etc.. I'm not particularly bothered by those details, I'm sure there's
> people who are.
> 
> All I really want is to consolidate all the various statistics we have
> across cpufreq/cpuidle/sched and provide cpufreq with scheduler
> callbacks because they've been telling me their current polling stuff
> sucks rocks.
> 
> Also the current state of affairs is that the cpufreq stuff is trying to
> guess what the scheduler is doing, and people are feeding that back into
> the scheduler. This I need to stop from happening ;-)

If I may interject one more point here.

If we go to all the trouble of integrating cpufreq/cpuidle/sched into scheduler
callbacks, we should place hooks into the thermal framework/PM as well.

It will pretty common to have per core temperature readings, on most
modern SoCs. 

It is quite conceivable to have a case with a multi-core CPU where due
to load imbalance, one (or more) of the cores is running at full speed
while the rest are mostly idle. What you want do, for best performance
and conceivably better power consumption, is not to throttle either 
frequency or lowers voltage to the overloaded CPU but to migrate the
load to one of the cooler CPUs.

This affects CPU capacity immediately, i.e. you shouldn't schedule more
load on a CPU that its too hot, since you'll only end up triggering thermal 
shutdown. The ideal solution would be to round robin
the load from the hot CPU to the cooler ones, but not so fast that we lose
due to the migration of state from one CPU to the other.

In a nutshell, the processing capacity of a core is not static, i.e. it
might degrade over time due to the increase of temperature caused by the
previous load.

What do you think?

Regards

-- Pantelis
