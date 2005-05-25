From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: OnDemand governor vs. work queue
Date: Thu, 26 May 2005 07:26:39 +1000
Message-ID: <1117056399.5076.0.camel@gaston>
References: <1116991600.6395.71.camel@gaston>
	<20050525095929.GD32472@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050525095929.GD32472@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

On Wed, 2005-05-25 at 11:59 +0200, Bruno Ducrot wrote:
> On Wed, May 25, 2005 at 01:26:40PM +1000, Benjamin Herrenschmidt wrote:
> > Hi !
> > 
> > >From what I've seen, the OnDemand governor works using a timer/workqueue
> > pair.
> > 
> > That annoys me a bit as the setup I have on PowerMacs can take several
> > ms to transition (due to voltage transition mostly). I don't like the
> > idea of hogging keventd that long.
> > 
> > Wouldn't it make sense, especially for setups where transition latency
> > is high (by high, I mean significant compared to HZ for example), to
> > actually spawn a kthread and do the sampling & switching from there ?
> 
> I'm wondering if in that case a userspace daemon will be more suited..

This is what I do & recommend for powerbook users (so far, powernowd
works like a charm), but since OnDemand governor advertises working with
latencies as big as 10ms, I was wondering ...

Ben.
