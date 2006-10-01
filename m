From: Dave Jones <davej@redhat.com>
Subject: Re: [1/5] reorganizes & code cleaning in acpi-cpufreq
Date: Sun, 1 Oct 2006 15:21:07 -0400
Message-ID: <20061001192107.GA26348@redhat.com>
References: <20060901140753.D14821@unix-os.sc.intel.com>
	<20060927024051.GA19413@redhat.com>
	<20060927024148.GA29163@redhat.com>
	<20061001064126.A16290@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061001064126.A16290@unix-os.sc.intel.com>
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
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: alexey.y.starikovskiy@intel.com, cpufreq <cpufreq@www.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>

On Sun, Oct 01, 2006 at 06:41:26AM -0700, Venkatesh Pallipadi wrote:
 > On Tue, Sep 26, 2006 at 10:41:48PM -0400, Dave Jones wrote:
 > > On Fri, Sep 01, 2006 at 02:07:53PM -0700, Venkatesh Pallipadi wrote:
 > > 
 > >  > Some clean up and redsign of the driver. Mainly making it easier to add
 > >  > support for multiple sub-mechanisms of changing frequency. Currently this
 > >  > driver supports only ACPI SYSTEM_IO address space. With the changes
 > >  > below it is easier to add support for other address spaces like Intel 
 > >  > Enhanced Speedstep which uses MSR (ACPI FIXED_FEATURE_HARDWARE) to do the 
 > >  > transitions.
 > > 
 > > This patch-series fell at the first hurdle.
 > > 
 > > error: patch failed: arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c:91
 > > error: arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c: patch does not apply
 > > 
 > 
 > This reject was coming from one earlier patch that hasn't gone it yet. The earlier bug fix patch had subject "acpi-cpufreq and software coordination".

patch 1 applied, then 2 fell over..

(15:16:02:davej@hera:cpufreq)$ git-applymbox -k ~/Mail/mbox 
8 patch(es) to process.

Applying '[CPUFREQ][1/8] acpi-cpufreq: software coordination and handle all CPUs in the group'

Wrote tree 9f1c808872662c1d54734a653ca49be772f82252
Committed: 402dcff780ede1c889c69ddff200d2f5bbb89853

Applying '[CPUFREQ][2/8] acpi-cpufreq: reorganize code to make MSR support addition easier'

error: patch failed: arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c:611
error: arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c: patch does not apply

git-applymbox is a little more anal than patch, so it will refuse to apply
patches with fuzz, and this one..

$ cat aaa | patch -p1 --dry-run
patching file arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
Hunk #21 succeeded at 598 with fuzz 2 (offset -1 lines).

has fuzz.

Patch 2 also adds back a #include <linux/config.h>  which isn't necessary.
Want to chop that out when you send the rediffed patch?

	Dave
