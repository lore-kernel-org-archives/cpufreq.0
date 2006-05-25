From: Jon Loeliger <jdl@freescale.com>
Subject: Re: [Fwd: Re: via-pmu runs device_power_down in atomic context]
Date: Thu, 25 May 2006 11:44:57 -0500
Message-ID: <1148575497.24946.40.camel@cashmere.sps.mot.com>
References: <20060524215917.230af218.akpm@osdl.org>
	<Pine.LNX.4.44L0.0605251005450.6990-100000@iolanthe.rowland.org>
	<20060525074412.19a03c22.akpm@osdl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <20060525074412.19a03c22.akpm@osdl.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Andrew Morton <akpm@osdl.org>
Cc: cpufreq@lists.linux.org.uk, johannes@sipsolutions.net, Alan Stern <stern@rowland.harvard.edu>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>

On Thu, 2006-05-25 at 09:44, Andrew Morton wrote:

> > In essence, the problem seemed to be that the cpufreq notifier chain is
> > sometimes expected to be blocking and sometimes expected to be atomic,
> > based on the "val" code passed to notifier_call_chain.  The cleanest
> > solution would be to split the single notifier chain into two chains,
> > one always blocking and the other always atomic.
> > 
> > Somebody who knows more about cpufreq than I do will have to make that
> > change.
> > 
> 
> I wouldn't describe the cpufreq project as a teeming hive of frenetic
> activity, and we need something pronto.
> 
> We could go back to a raw_notifier and be as buggy as we used to be.

It _is_ actively being pursued today for a cleaned up
implementation.  If there are issues or requirements
here, we should really pass them on to the linux-pm list.

Thanks,
jdl
