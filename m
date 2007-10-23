From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Get core affinity from
	acpi_processor_preregister_performance()
Date: Tue, 23 Oct 2007 17:21:55 -0400
Message-ID: <20071023212155.GK15801@redhat.com>
References: <200710231535.24805.mark.langsdorf@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200710231535.24805.mark.langsdorf@amd.com>
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
To: Mark Langsdorf <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

On Tue, Oct 23, 2007 at 03:35:24PM -0500, Mark Langsdorf wrote:
 > This should apply on top of the architectural pstate patch I just
 > submitted.  It has been tested on several laptops and a few servers,
 > with 2nd and 3rd generation Opteron parts and some Turion X2s.
 > 
 >  
 >  #define PFX "powernow-k8: "
 >  #define BFX PFX "BIOS error: "
 > -#define VERSION "version 2.00.00"
 > +#define VERSION "version 2.20.00"
 >  #include "powernow-k8.h"

This looks like it includes your previous patch, rather than being
on top of it.  Care to rediff ?

thanks,

	Dave

-- 
http://www.codemonkey.org.uk
