From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] acpi-cpufreq: force transitions even if driver thinks
	CPU is already at given P-State
Date: Sun, 10 Oct 2004 23:54:16 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041010215416.GA28310@dominikbrodowski.de>
References: <88056F38E9E48644A0F562A38C64FB60030F1A5B@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60030F1A5B@scsmsx403.amr.corp.intel.com>
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
Cc: davej@redhat.com, cpufreq@www.linux.org.uk

On Fri, Oct 08, 2004 at 02:01:54PM -0700, Pallipadi, Venkatesh wrote:
> I am worried about the performance implication that this would have
> with governors like ondemand. Especially since writing to IO port 
> involves some SMM transitions and may cost something like 100uS.

Indeed. Though, with the ACPI spec broken as it is, we should do
_something_. Question is: what? Any ideas?

	Dominik
