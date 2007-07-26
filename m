From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH]gx-suspmod.c use boot_cpu_data instead of
	current_cpu_data
Date: Thu, 26 Jul 2007 12:46:54 -0400
Message-ID: <20070726164654.GC32159@redhat.com>
References: <20070725141905.GA4567@darkstar.te-china.tietoenator.com>
	<20070724234045.2cec5525.akpm@linux-foundation.org>
	<a8e1da0707252120l5e9e441bm53e2ba25bc9c20f0@mail.gmail.com>
	<20070725212638.79bc3945.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20070725212638.79bc3945.akpm@linux-foundation.org>
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
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@www.linux.org.uk, Dave Young <hidave.darkstar@gmail.com>, linux-kernel@vger.kernel.org

On Wed, Jul 25, 2007 at 09:26:38PM -0700, Andrew Morton wrote:
 > On Thu, 26 Jul 2007 04:20:10 +0000 "Dave Young" <hidave.darkstar@gmail.com> wrote:
 > 
 > > >On 7/25/07, Andrew Morton <akpm@linux-foundation.org> wrote:
 > > > On Wed, 25 Jul 2007 14:19:05 +0000 Dave Young <hidave.darkstar@gmail.com> wrote:
 > > >
 > > > > Hi,
 > > > > in preemptible kernel will report BUG: using smp_processor_id() in preemptible, so use boot_cpu_data instead of current_cpu_data.
 > > > >
 > > > > Signed-off-by: Dave Young <hidave.darkstar@gmail.com>
 > > > >
 > > > > ---
 > > > > arch/i386/kernel/cpu/cpufreq/gx-suspmod.c |    4 ++--
 > > > > 1 file changed, 2 insertions(+), 2 deletions(-)
 > > > >
 > > > > diff -pur linux/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c linux.new/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c
 > > > > --- linux/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c   2007-07-25 14:11:06.000000000 +0000
 > > > > +++ linux.new/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c       2007-07-25 13:57:29.000000000 +0000
 > > > > @@ -181,8 +181,8 @@ static __init struct pci_dev *gx_detect_
 > > > >       struct pci_dev *gx_pci = NULL;
 > > > >
 > > > >       /* check if CPU is a MediaGX or a Geode. */
 > > > > -     if ((current_cpu_data.x86_vendor != X86_VENDOR_NSC) &&
 > > > > -         (current_cpu_data.x86_vendor != X86_VENDOR_CYRIX)) {
 > > > > +     if ((boot_cpu_data.x86_vendor != X86_VENDOR_NSC) &&
 > > > > +         (boot_cpu_data.x86_vendor != X86_VENDOR_CYRIX)) {
 > > > >               dprintk("error: no MediaGX/Geode processor found!\n");
 > > > >               return NULL;
 > > > >       }
 > > >
 > > > um, I suspect it really wants to get at the current CPU.  But putting a
 > > > preempt_disable() around just that code is meaningless: the current CPU
 > > > could change immediately before or after the code block. It needs deeper
 > > > fixing, methinks.
 > > The only target is to get the cpu vendor, so boot_cpu_data is enough,
 > > the drivers/mtd/nand/cs553x_nand.c has the same usage.
 > 
 > I think there's some vague ambition in there to support non-identical CPUs.
 > In which case reading from the local CPU would make more sense.  (waves
 > frantically at cpufreq developers).

a non-identical CPU system with a geode + something else doesn't exist
and is very unlikely to happen.

	Dave

-- 
http://www.codemonkey.org.uk
