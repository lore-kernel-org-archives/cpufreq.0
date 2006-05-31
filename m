From: Dave Jones <davej@redhat.com>
Subject: cpufreq & dual core CPUs.
Date: Wed, 31 May 2006 00:26:39 -0400
Message-ID: <20060531042639.GA8609@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

After being prompted by akpm to look into this (he noted his builds
were taking twice as long when cpuspeed was active on his core duo laptop),
I did some tests on a similar spec laptop myself, and it seems that
we have a number of shortcomings in cpufreq right now when presented
with a multi-core CPU.

This CPU has two cores in a single package, yet cpufreq doesn't
realise this, and presents them as two separately independant scalable
CPUs, as if they were regular SMP.

The problems this causes are twofold.

- We get into situations where strange things happen like
  CPU0 being at 1GHz whilst CPU1 is at 2GHz, and a foodfight
  ensues as both cores continually readjust themselves to
  match what the other is doing.
  (This is actually quite amusing to watch if you configure two
   of the gnome cpufreq applets)
  This seems to affect both userspace daemons like cpuspeed,
  and also (to a lesser extent) the ondemand/conservative governors.

  By adding dual-core awareness to the drivers, we can make sure
  that all cores in a single package stay in sync.

- We allow the possibility for different governors on each core.
  Ie, you can set core0 to ondemand and core1 to userspace.
  I'm not convinced this is a good idea even on SMP, but on
  multi-core it for sure makes no sense.

  One way to fix this would be to ensure that updating the
  governor on one core automatically updates the governor
  on all other cores.  It does mean that the CPU agnostic drivers/cpufreq/
  core will have to start caring about architecture specific things
  like the core maps however.

Before looking any further into why Andrews performance suffered
so much (it aparently never shifted up from 1GHz unless he ran
two intensive tasks, keeping both cores busy), I think getting
the above in order makes sense.

Comments?

		Dave

-- 
http://www.codemonkey.org.uk
