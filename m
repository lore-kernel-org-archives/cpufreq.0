From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 3/8] acpi-cpufreq: merge acpi functionality of cpufreq
	drivers
Date: Thu, 3 Aug 2006 12:20:24 -0400
Message-ID: <20060803162024.GA22448@redhat.com>
References: <44CE4F8A.5060600@linux.intel.com>
	<20060802092733.GI17014@poupinou.org>
	<44D0F292.8090403@linux.intel.com>
	<20060803161130.GL17014@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060803161130.GL17014@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

On Thu, Aug 03, 2006 at 06:11:30PM +0200, Bruno Ducrot wrote:
 > On Wed, Aug 02, 2006 at 10:44:34PM +0400, Alexey Starikovskiy wrote:
 > > Bruno Ducrot wrote:
 > > > I've not checked carrefully but it seems to me you are breaking
 > > > powernow-k8.
 > > We do not touch powernow-k8, and tried to make sure we do not change
 > > acpi-cpufreq to exclude any unknown hardware. What we tried to do, is to merge
 > > different ways of accessing cpufreq with ACPI under single driver. Could you be
 > > more specific how we break powernow-k8?
 > 
 > I haven't seen the if (!check_speedstep_cpu(cpu)) {...} onto
 > apci_cpufreq_cpu_init_acpi() indeed.
 > 
 > Therefore you are correct.
 > 
 > But it's funny to see that how acpi_cpufreq driver become
 > so Intel specific.

I've not looked over these patches in detail yet, but one precondition
is that acpi-cpufreq _must_ continue to work on non-Intel.
Newer VIA CPUs rely on this driver rather than longhaul for example.

 > If AMD or any other vendors want to add their stuff
 > onto acpi_cpufreq, then should we accept their patches
 > as well?

Absolutely.

		Dave


-- 
http://www.codemonkey.org.uk
