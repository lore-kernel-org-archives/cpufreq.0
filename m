From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Adding SMP capability to MSR based Enhanced Speedstep
Date: Sat, 26 Jun 2004 22:05:06 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040626200506.GA8158@dominikbrodowski.de>
References: <88056F38E9E48644A0F562A38C64FB600235523B@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB600235523B@scsmsx403.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: jeremy@goop.org, cpufreq@www.linux.org.uk

To clarify:

On Fri, Jun 25, 2004 at 04:31:10PM -0700, Pallipadi, Venkatesh wrote:
> -#define ACPI_PDC_CAPABILITY_ENHANCED_SPEEDSTEP 0x1
> -

This define is moved, and a proper define for ACPI_PDC_EST_CAPABILITY_SMP
will be added to include/acpi/processor.h, as far as I am aware of -- and
it's done in the "add SMP support to acpi-cpufreq driver" patch, IIRC.

	Dominik
