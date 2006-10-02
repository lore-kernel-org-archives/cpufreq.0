From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 2/8]cpufreq: acpi-cpufreq: reorganize code to make MSR
	support addition easier
Date: Tue, 3 Oct 2006 01:42:33 +0200
Message-ID: <20061002234233.GA29795@isilmar.linta.de>
References: <EB12A50964762B4D8111D55B764A8454ABC2A5@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <EB12A50964762B4D8111D55B764A8454ABC2A5@scsmsx413.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: "Starikovskiy, Alexey Y" <alexey.y.starikovskiy@intel.com>, Dave Jones <davej@redhat.com>, cpufreq <cpufreq@www.linux.org.uk>

On Mon, Oct 02, 2006 at 04:32:05PM -0700, Pallipadi, Venkatesh wrote:
> Ohh OK. I understand your point. Good catch.
> get_cur_freq_on_cpu() is used in ->get() method for IO port driver.
> It will work OK with get method when previous set transition is
> successful. But, it will give strange result when previous set is not
> successful. Is this the case you were mentioning. 

Yes. Sorry for not making this clearer before.

Thanks,
	Dominik
