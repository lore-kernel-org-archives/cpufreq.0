From: john stultz <johnstul@us.ibm.com>
Subject: Re: give the TSC a fair chance [Was: [PATCHES] cpufreq_get(),
	cpufreq->get()]
Date: Wed, 14 Apr 2004 11:24:21 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1081967060.4705.91.camel@cog.beaverton.ibm.com>
References: <20040411215912.GA8160@dominikbrodowski.de>
	<20040412120422.GA7337@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040412120422.GA7337@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk

On Mon, 2004-04-12 at 05:04, Dominik Brodowski wrote:
> However, this patch has one slight chance for a bug: if lost_count reaches
> 50, a call to handle_cpufreq_delayed_work is scheduled, but does not execute
> until lost_count reaches 50 again [e.g. when no lost ticks are
> detected at the next call, but on the next 50 consecutive calls...]. As
> keventd runs at -10 priority I doubt this will happen under normal
> circumstances, though.

I'm not sure I follow this (lost_count == 50) bit. You're trying to
schedule work only when we've noticed we're missing exactly 50 ticks?
I'm not sure I understand the significance of that value.

thanks
-john
