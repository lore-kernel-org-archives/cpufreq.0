From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Subject: Re: [PATCH RFC 0/4] Scheduler idle notifiers and users
Date: Wed, 15 Feb 2012 14:38:04 +0100
Message-ID: <1329313084.2293.105.camel@twins>
References: <20120208013959.GA24535@panacea>
 <1328670355.2482.68.camel@laptop> <20120208202314.GA28290@redhat.com>
 <1328736834.2903.33.camel@pasglop> <20120209075106.GB18387@elte.hu>
 <4F35DD3E.4020406@codeaurora.org> <20120211143951.GA24564@sirena.org.uk>
 <1328971983.11320.5.camel@laptop>
 <20120211153324.GC31887@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120211153324.GC31887@opensource.wolfsonmicro.com>
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
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linaro-kernel@lists.linaro.org, Russell King <linux@arm.linux.org.uk>, Nicolas Pitre <nico@fluxnic.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Oleg Nesterov <oleg@redhat.com>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Anton Vorontsov <anton.vorontsov@linaro.org>, Saravana Kannan <skannan@codeaurora.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Mike Chan <mike@android.com>, Dave Jones <davej@redhat.com>, Ingo Molnar <mingo@elte.hu>, Todd Poynor <toddpoynor@google.com>, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, Arjan Van De Ven <arjan@infradead.org>

On Sat, 2012-02-11 at 15:33 +0000, Mark Brown wrote:
> > Having to actually wait for this in software is quite ridiculous.
> 
> Well, it's also not terribly hard. 

Having to schedule from the scheduler is. Which is exactly the situation
you'll end up with if you want scheduler driven cpufreq, which I thought
everybody wanted because polling state sucks.

>  There's use cases for having this
> stuff offloaded but if you're not doing that stuff then why deal with
> the complication of designing the hardware? 

Because doing it in software is more expensive?

Penny-wise pound-foolish like thing.. you make the software requirements
more complex, which results in more bugs (more cost in debugging), more
runtime (for doing the 'software' thing), less power savings.

Esp since all this uC/system-controller stuff is already available and
validated.
