From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 2.6.14] cpufreq: don't suggest speedstep-centrino for
	Dothan-based Celeron-M processors
Date: Sun, 4 Dec 2005 17:46:20 +0100
Message-ID: <20051204164620.GA8422@isilmar.linta.de>
References: <88056F38E9E48644A0F562A38C64FB60067F424F@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60067F424F@scsmsx403.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: CPUFreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>, davej@redhat.com

Hi,

On Fri, Dec 02, 2005 at 01:19:27PM -0800, Pallipadi, Venkatesh wrote:
> I understand acpi_throttle and processor_thermal doing it. But,
> p4-clockmod, meant for cooling should actual run like acpi_throttle and
> get triggered more like throttle rather than powersaving frequency
> drivers. Right? 
> Also, if throttling information is not there in ACPI, even then P4
> clockmod can potentially be used as a replacement for acpi_throttle and
> coexist with say acpi-cpufreq.

Yes, exactly. In my TODO list for cpufreq, I still have this entry:
- [core] evaluate use of > 1 drivers at one time (CPUFREQ_THROTTLING, 
        CPUFREQ_SCALING)

However, as I'm too busy at the moment to tackle this issue, it'd be great
if someone else could handle this one ;)

Thanks,
	Dominik
