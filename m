From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Dothan VID# identification script (was Re: [ACPI]
	Speedstep-centrino problems)
Date: Sun, 20 Feb 2005 15:42:41 +0100
Message-ID: <20050220144241.GA20702@isilmar.linta.de>
References: <88056F38E9E48644A0F562A38C64FB60040DBAD8@scsmsx403.amr.corp.intel.com>
	<42189D50.8020501@bartol.udel.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42189D50.8020501@bartol.udel.edu>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rich Townsend <rhdt@bartol.udel.edu>
Cc: cpufreq@ZenII.linux.org.uk, Simon Moore <Simon_Moore@condisline.com>

On Sun, Feb 20, 2005 at 09:23:12AM -0500, Rich Townsend wrote:
> OK! What is the offset of the CNTL MSR?

MSR_IA32_PERF_CTL


> And does it decode to a freq/voltage pair in the same way as STATUS?

Yes.

> On a related note, is there a simple way to set the CPU to its maximum 
> frequency, without having to know what the associated voltage is?

Using speedstep-centrino, no.

	Dominik
