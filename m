From: Marc Singer <elf@buici.com>
Subject: Re: Athlon 64 complains of frequency mismatch
Date: Tue, 22 Jun 2004 09:07:41 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040622160741.GA15216@buici.com>
References: <84EA05E2CA77634C82730353CBE3A8431990F7@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A8431990F7@SAUSEXMB1.amd.com>
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
To: paul.devriendt@amd.com
Cc: cpufreq@www.linux.org.uk

On Tue, Jun 22, 2004 at 08:26:38AM -0700, paul.devriendt@amd.com wrote:
> > Perhaps I'm missing something.  If AMD advertizes Cool&Quiet as does
> > this vendor, MSI, then there has to be someplace where this data is
> > given to Windows.  Are we talking about the vendor providing a Windows
> > driver without including the necessary information in the BIOS?
> 
> The Windows XP driver gets the information from the same place as
> the Linux driver ... the ACPI _PSS object.

And if there is no _PSS ACPI object(s)?

> If Windows is able to find the data but Linux can not, then we have
> some sort of bug or spec compliance issue.
> 
> Windows 2000 gets the information from the BIOS PSB table, and the
> Linux driver is also capable of using this data (if CONFIG_ACPI_PROCESSOR
> is not set, or if ACPI _PSS data can not be found).

I take this to mean that I might see the correct data if I disable the
ACPI PROCESSOR module.  Right?
