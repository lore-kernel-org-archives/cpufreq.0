From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][retry] Report the number of processors in PowerNow-k8
	correctly [2/2]
Date: Thu, 5 Apr 2007 16:29:58 -0400
Message-ID: <20070405202958.GA28783@redhat.com>
References: <46096F1F.8030201@amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <46096F1F.8030201@amd.com>
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
To: Mark Langsdorf <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

On Tue, Mar 27, 2007 at 02:23:11PM -0500, Mark Langsdorf wrote:
 > The PowerNow! driver for Opteron reports the number of cores
 > in the system, but claims to report the number of processors.
 > Fix this minor cosmetic bug.
 > 
 > Signed-Off-By: Bhavana Nagendra <bhavana.nagendra@amd.com>
 > Acked-by: Mark Langsdorf <mark.langsdorf@amd.com>
 > 
 > --- linux-2.6.18.x86_64/arch/i386/kernel/cpu/cpufreq/powernow-k8.c.orig 
 > 2007-03-22 16:13:04.630175768 -0500
 > +++ linux-2.6.18.x86_64/arch/i386/kernel/cpu/cpufreq/powernow-k8.c 
 > 2007-03-22 16:19:40.153047152 -0500
 > @@ -840,7 +840,8 @@ static int powernow_k8_cpu_init_acpi(str
 > 
 > 	/* fill in data */
 > 	data->numps = data->acpi_data.state_count;
 > -	print_basics(data);
 > +	if (first_cpu(cpu_core_map[data->cpu]) == data->cpu)
 > +		print_basics(data);
 > 	powernow_k8_acpi_pst_values(data, 0);
 > 
 > 	/* notify BIOS that we exist */

Back from vacation..

I rolled both of these together into the same diff, as they're both
the same changelog, so it doesn't make a huge amount of sense to me
to have them as separate commits.
But sadly..

(16:23:19:davej@hera:cpufreq)$ git-applymbox -k ~/Mail/mbox 
1 patch(es) to process.

Applying '[CPUFREQ] Report the number of processors in PowerNow-k8 correctly'

error: i386/kernel/cpu/cpufreq/powernow-k8.c: does not exist in index

Bah.. some hand fixing up of the path in the diff later..

(16:23:28:davej@hera:cpufreq)$ vim ~/Mail/mbox 
(16:23:41:davej@hera:cpufreq)$ git-applymbox -k ~/Mail/mbox 
1 patch(es) to process.

Applying '[CPUFREQ] Report the number of processors in PowerNow-k8 correctly'

error: patch failed: arch/i386/kernel/cpu/cpufreq/powernow-k8.c:661
error: arch/i386/kernel/cpu/cpufreq/powernow-k8.c: patch does not apply


I give up..

	Dave

-- 
http://www.codemonkey.org.uk
