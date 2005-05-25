From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: OnDemand governor vs. work queue
Date: Wed, 25 May 2005 13:26:40 +1000
Message-ID: <1116991600.6395.71.camel@gaston>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi !

From what I've seen, the OnDemand governor works using a timer/workqueue
pair.

That annoys me a bit as the setup I have on PowerMacs can take several
ms to transition (due to voltage transition mostly). I don't like the
idea of hogging keventd that long.

Wouldn't it make sense, especially for setups where transition latency
is high (by high, I mean significant compared to HZ for example), to
actually spawn a kthread and do the sampling & switching from there ?

Regard,
Ben.
