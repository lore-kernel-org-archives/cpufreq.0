From: Dave Jones <davej@redhat.com>
Subject: Re: rdmsr_on_cpu, wrmsr_on_cpu et al
Date: Wed, 17 Jan 2007 20:01:34 -0500
Message-ID: <20070118010134.GB31366@redhat.com>
References: <20070117132613.GC6021@localhost.sw.ru>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20070117132613.GC6021@localhost.sw.ru>
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
To: Alexey Dobriyan <adobriyan@openvz.org>
Cc: cpufreq@lists.linux.org.uk, devel@openvz.org

On Wed, Jan 17, 2007 at 04:26:13PM +0300, Alexey Dobriyan wrote:
 > Hi, Dave!
 > 
 > There was OpenVZ specific bug rendering some cpufreq drivers unusable
 > on SMP. In short, when cpufreq code thinks it confined itself to
 > needed cpu by means of set_cpus_allowed() to execute rdmsr, some
 > "virtual cpu" feature can migrate process to anywhere. This triggers
 > bugons and does wrong things in general.
 > 
 > This got fixed by introducing rdmsr_on_cpu and wrmsr_on_cpu executing
 > rdmsr and wrmsr on given physical cpu by means of smp_call_function_single().
 > 
 > So, understanding p4-clockmod is not the only driver that was affected,
 > is something like this acceptable for start?

This is probably useful outside of cpufreq too, so should probably
go somewhere in include/asm/processor.h for eg.
Looks ok on a quick glance, but I'd like to see if anyone on lkml
has any comments, especially the usual x86/x86-64 experts.

		Dave

-- 
http://www.codemonkey.org.uk
