From: Dave Jones <davej@redhat.com>
Subject: longrun.
Date: Sat, 3 Jul 2004 17:38:07 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040703163807.GU7101@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

I was just looking into this..
Error: ./arch/i386/kernel/cpu/cpufreq/longrun.o .data refers to 00000018 R_386_32          .init.text

When I noticed that longrun_get_policy() is only called from longrun_cpu_init().
Is there a reason this driver doesn't have a .getpolicy method pointer pointing
to this routine ?

Incidentally, I'm a bit puzzled by the error.
The only __init functions are ..

longrun_get_policy
longrun_determine_freqs
longrun_cpu_init
longrun_init

The first two are only called by the 3rd. and the 3rd/4th are
only ever called at init time.

What do I miss here?

		Dave
