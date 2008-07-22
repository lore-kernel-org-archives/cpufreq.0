From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: cpufreq, memory voltage, operation points, etc. [Was: cpu]
Date: Wed, 23 Jul 2008 01:40:05 +0200
Message-ID: <20080722234005.GA24198@isilmar.linta.de>
References: <d01ec2f30807220436j12d64f6bh3ceb8ac10f280ef0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <d01ec2f30807220436j12d64f6bh3ceb8ac10f280ef0@mail.gmail.com>
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
To: Vinod Hegde <vinod.hegde.c@gmail.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Tue, Jul 22, 2008 at 02:36:30PM +0300, Vinod Hegde wrote:
> I am new to this topic. So the question could be fundamental.

indeed, it is.

> What action does cpufreq take for the memory sub system. I mean, once
> cpuload is known, does it assume anything about the memory usage and alter
> the voltage of any memory module. Is any change brought for any other
> hardware components based on cpu load except cpu.

A typical lawyer's answer: it depends.

- on the x86 architecture(s), there is no kernel-based interaction with the
  memory system, the voltage of any memory modules, etc.

- on some arm architecture(s), some memory module drivers register cpufreq
  notifiers, for there are certain constraints of which CPU frequencies can
  be run for certain memory (or other CPU-external subsystems) settings.
  However, this is hardly a coordinated effort to lower the overall
  reduction of power usage, even though we're glad for all positive
  side-effects in this regard.

However, there's been spent some thought on integrating cpufreq into a wider
"operating points" framework (or vice versa), where certain CPU frequencies
(or ranges thereof) correlate with memory, I/O etc. settings. Unless I
missed something, this hasn't been merged, though the clock and voltage 
framework and the recent pull request for a Voltage & Current regulator
framework (http://lkml.org/lkml/2008/7/22/189) might constitute some great
groundwork for this...

Best,
	Dominik
