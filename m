From: Mattia Dongili <malattia@linux.it>
Subject: Re: [Bug 8671] CPU frequency always on highest frequency after
	wakeup from suspend to disk
Date: Mon, 25 Jun 2007 23:11:55 +0900
Message-ID: <20070625141154.GB13308@inferi.kami.home>
References: <20070625133403.820121080F9@picon.linux-foundation.org>
	<1182780094.22063.30.camel@queen.suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1182780094.22063.30.camel@queen.suse.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>

On Mon, Jun 25, 2007 at 04:01:34PM +0200, Thomas Renninger wrote:
> On Mon, 2007-06-25 at 06:34 -0700, bugme-daemon@bugzilla.kernel.org
> wrote:
> > http://bugzilla.kernel.org/show_bug.cgi?id=8671
> > 
> 
> > ------- Comment #1 from malattia@linux.it  2007-06-25 06:37 -------
> > aaaah, maybe that's because CPU1 is offlined and when resumed .init is called
> > which sets the CPUFREQ_DEFAULT_GOVERNOR.
> > In fact after resume CPU1 has the performance governor here, could you check
> > it's the case for you as well?
> > 
> > Any suggestion on how to solve that?
> > Maybe cpufreq_add_dev should set the CPU0 policy as default when other CPUs are
> > up-ed?
> > 
> Can you reproduce this by simply offlining the cpu and checking
> governors?:
> echo 0 >/sys/devices/cpu/cpu1/online
> echo 1 >/sys/devices/cpu/cpu1/online
> cat /sys/devices/cpu/cpu1/cpufreq/scaling_governor

yep, definitely reproducible.

> Do you still have an older kernel (2.6.21 or older) with working cpufreq
> installed? Can you double check on this, pls.

herm... no. I'm on 2.6.22-rc4-mm2, I have 2.6.22-rc5 handy, all the
other .21 are -mm patched.

Anyway it seems rather odd that the cpu drivers are setting the governor
in place of the cpufreq subsystem itself. To me it looks more natural to
think it's cpufreq_add_dev who has set the governor.

-- 
mattia
:wq!
