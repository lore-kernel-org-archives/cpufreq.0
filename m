From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 1/1] Provide support for 6 bit FID codes
Date: Thu, 28 Jul 2005 23:08:28 -0400
Message-ID: <20050729030828.GA15556@redhat.com>
References: <84EA05E2CA77634C82730353CBE3A84301CFC1D5@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84301CFC1D5@SAUSEXMB1.amd.com>
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
Content-Transfer-Encoding: 7bit
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

On Thu, Jun 23, 2005 at 05:39:04PM -0500, Langsdorf, Mark wrote:
 > Opteron revision F will support higher frequencies than
 > can be encoded in the current driver's 4 bit frequency
 > field.  This patch updates the driver to support Rev F
 > including 6 bit FIDs and processor ID updates.
 > 
 > This should apply cleanly whether or not the dual-core
 > bugfix I sent out last week is applied.  I'd prefer 
 > that both get applied, of course.
 > 
 > Signed-off-by: David Keck <david.keck@amd.com>
 > Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>
 > 
 > -Mark Langsdorf
 > AMD, Inc.

arch/i386/kernel/cpu/cpufreq/powernow-k8.c: In function `powernow_k8_acpi_pst_values':
arch/i386/kernel/cpu/cpufreq/powernow-k8.c:698: `EXT_TYPE_SHIFT' undeclared (first use in this function)
arch/i386/kernel/cpu/cpufreq/powernow-k8.c:698: (Each undeclared identifier is reported only once
arch/i386/kernel/cpu/cpufreq/powernow-k8.c:698: for each function it appears in.)
arch/i386/kernel/cpu/cpufreq/powernow-k8.c:698: `EXT_TYPE_MASK' undeclared (first use in this function)
arch/i386/kernel/cpu/cpufreq/powernow-k8.c: In function `powernow_k8_cpu_init_acpi':
arch/i386/kernel/cpu/cpufreq/powernow-k8.c:740: warning: unused variable `vid'
arch/i386/kernel/cpu/cpufreq/powernow-k8.c:739: warning: unused variable `fid'
arch/i386/kernel/cpu/cpufreq/powernow-k8.c:743: warning: unused variable `vid'
arch/i386/kernel/cpu/cpufreq/powernow-k8.c:742: warning: unused variable `fid'
arch/i386/kernel/cpu/cpufreq/powernow-k8.c:746: `fid' undeclared (first use in this function)
arch/i386/kernel/cpu/cpufreq/powernow-k8.c:746: `vid' undeclared (first use in this function)
make[1]: *** [arch/i386/kernel/cpu/cpufreq/powernow-k8.o] Error 1
make: *** [arch/i386/kernel/cpu/cpufreq/powernow-k8.o] Error 2

Looks like there's a chunk of this missing ? Can you send an incremental
fixing this up please ?  I'll leave the previous diff in the cpufreq git
tree, and just send the fix along with it when Linus pulls.

Thanks,

		Dave
