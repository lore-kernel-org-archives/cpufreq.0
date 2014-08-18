From: Ashwin Chaugule <ashwin.chaugule@linaro.org>
Subject: Re: [RFC 0/3] Experimental patchset for CPPC
Date: Mon, 18 Aug 2014 10:54:01 -0400
Message-ID: <CAJ5Y-eYS45mPZUsQvvacG3revVedaYHoo9YaFcM5fb4+QrH43A@mail.gmail.com>
References: <1408046230-16439-1-git-send-email-ashwin.chaugule@linaro.org>
	<20140814205143.GY6758@twins.programming.kicks-ass.net>
	<CAJ5Y-ebgJi8Ngxg1X+h7KMundGZPFhYC0hr0Sog6htj=czszgQ@mail.gmail.com>
	<20140815061917.GX19379@twins.programming.kicks-ass.net>
	<CAJ5Y-eaLxCG7dDao00pozXBL2dxPS7tf=xGfaz3O_xfRHtQZnA@mail.gmail.com>
	<20140815140741.GI19379@twins.programming.kicks-ass.net>
	<CAJ5Y-eZhAX47v4SjsW4T6PUaiMqC9wHcMDS8p+sL4_cReZpbyw@mail.gmail.com>
	<20140815144124.GK19379@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20140815144124.GK19379@twins.programming.kicks-ass.net>
Sender: linux-acpi-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Mike Turquette <mike.turquette@linaro.org>, Morten Rasmussen <morten.rasmussen@arm.com>, Arjan van de Ven <arjan@linux.intel.com>, mingo@kernel.org, len.brown@intel.com, rjw@rjwysocki.net, "linaro-acpi@lists.linaro.org" <linaro-acpi@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-acpi@vger.kernel.org, cpufreq@vger.kernel.org, Patch Tracking <patches@linaro.org>, Dirk Brandewie <dirk.brandewie@gmail.com>

Hello,

On 15 August 2014 10:41, Peter Zijlstra <peterz@infradead.org> wrote:
> On Fri, Aug 15, 2014 at 10:37:32AM -0400, Ashwin Chaugule wrote:
>> On 15 August 2014 10:07, Peter Zijlstra <peterz@infradead.org> wrote:
>> > On Fri, Aug 15, 2014 at 09:08:50AM -0400, Ashwin Chaugule wrote:
>> >> If the OS only looks at Highest, Lowest, Delivered registers and only
>> >> writes to Desired, then we're not really any different than how we do
>> >> things today in the CPUFreq layer.
>> >
>> > The thing is; we're already struggling to make 'sense' of x86 as it
>> > stands today. And it looks like this CPPC stuff makes the behaviour even
>> > less certain.
>>
>> I think its still better than the "p-state" thing we have going today,
>> where the algorithms are making their decisions based on the incorrect
>> assumption that the CPU got what it requested for. (among other things
>> listed earlier.) CPPC at least gives you a guarantee that the
>> delivered performance will be within a range you requested. It can
>> even force the platform to deliver a specific performance value if you
>> choose over a specific time window.
>
> Maybe; the guarantee and interrupt on change might be useful indeed. But
> which ever way we need aperf/mperf ratios somewhere.

Right. Regarding aperf/mperf; some ARMs will re-use existing
performance counters, while others may have dedicated registers to
count the equivalent. So I'm suggesting the use of the CPPC
descriptors to unify the various implementations. In CPPC terms, aperf
maps to the Delivered ctr and mperf maps to the Nominal ctr. Until we
have rest of the plumbing in the scheduler to make use of the other
CPPC specified regs, we can at least start off with having a common
lower level driver as suggested in this patchset and reusing the PID
controller as the "governor". Thats the only one that actually makes
use of aperf/mperf today AFAIK. The driver can then be modified to
include the Freq domain awareness as well, so that it works well on
non-X86 platforms. Unless anyone strongly thinks that we should fix
the shortcomings in the CPUfreq layer(broken pstate and freq domain
assumptions) rather than enhancing PID? Thoughts?


Cheers,
Ashwin
